package cn.mldn.util.fastdfs;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;

import org.csource.common.MyException;
import org.csource.common.NameValuePair;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient;
import org.csource.fastdfs.StorageServer;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.springframework.core.io.ClassPathResource;

public class FastDFSUtil {
	/**
	 * 图片服务器删除类
	 * @param group 图片所在服务器组名称：group1 ...
	 * @param path 图片路径，类似：M00/00/00/wKgcollHN3OADl06AALyUUgDuec268.jpg
	 */
	public static void FastDFSDelete(String group,String path) {
		// 通过ClassPath路径获取要使用的配置文件
		ClassPathResource classPathResource = new ClassPathResource("fastdfs_client.conf");
		// 进行客户端访问的整体配置，需要知道配置文件的完整路径
		try {
			ClientGlobal.init(classPathResource.getClassLoader().getResource("fastdfs_client.conf")
					.getPath());
		} catch (FileNotFoundException e) {
			System.out.println("找不到配置文件文件");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("配置文件IO异常");
			e.printStackTrace();
		} catch (MyException e) {
			System.out.println("MyException");
			e.printStackTrace();
		}
		// FastDFS的核心操作在于tracker处理上，所以此时需要定义Tracker客户端
		TrackerClient trackerClient = new TrackerClient();
		// 定义TrackerServer配置信息
		TrackerServer trackerServer = null;
		try {
			trackerServer = trackerClient.getConnection();
		} catch (IOException e) {
			System.out.println("TrackerServer配置信息IO异常");
			e.printStackTrace();
		}
		// 在整个FastDFS之中真正负责干活的是Storage
		StorageServer storageServer = null;
		StorageClient storageClient = new StorageClient(trackerServer, storageServer);
		int delete_file = -1 ;
		try {
			delete_file = storageClient.delete_file(group, path) ;
		} catch (IOException e) {
			System.out.println("delete_file---IO异常");
			e.printStackTrace();
		} catch (MyException e) {
			System.out.println("delete_file----MyException");
			e.printStackTrace();
		}
		System.out.println(delete_file);	// 删除成功返回0
		try {
			trackerServer.close();
		} catch (IOException e) {
			System.out.println("tarckerServer close Exception");
			e.printStackTrace();
		}
	}
	/**
	 * 图片服务器上传工具类
	 * @param filePath 图片所在路径，格式"C:\\Users\\123\\xxx.jpg","\\"为转移字符
	 * @throws Exception 异常
	 */
	public static void FastDFSUpload(String filePath) throws Exception {
		String drive = filePath.substring(0, 2); // 表示盘符
		File imgFile = null; // 需要上传的文件
		if ("/".contains(filePath)) { // 此为window路径格式
			imgFile = new File(drive + filePath.substring(2).replaceAll("/", File.separator));
		} else if ("\\".contains(filePath)) { // 此为linux路径格式
			imgFile = new File(drive + filePath.substring(2).replaceAll("\\", File.separator));
		} else { // 没有路径分割符
			imgFile = new File(filePath);
		}
		// 如果要想进行上传则一定需要获取到文件的扩展名称
		String fileExtName = imgFile.getName().substring(imgFile.getName().lastIndexOf(".") + 1);
		// 通过ClassPath路径获取要使用的配置文件
		ClassPathResource classPathResource = new ClassPathResource("fastdfs_client.conf");
		// 进行客户端访问的整体配置，需要知道配置文件的完整路径
		try {
			ClientGlobal.init(classPathResource.getClassLoader().getResource("fastdfs_client.conf")
					.getPath());
		} catch (FileNotFoundException e) {
			System.out.println("找不到配置文件文件");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("配置文件IO异常");
			e.printStackTrace();
		} catch (MyException e) {
			System.out.println("MyException");
			e.printStackTrace();
		}
		// FastDFS的核心操作在于tracker处理上，所以此时需要定义Tracker客户端
		TrackerClient trackerClient = new TrackerClient();
		// 定义TrackerServer配置信息
		TrackerServer trackerServer = null;
		try {
			trackerServer = trackerClient.getConnection();
		} catch (IOException e) {
			System.out.println("TrackerServer配置信息IO异常");
			e.printStackTrace();
		}
		// 在整个FastDFS之中真正负责干活的是Storage
		StorageServer storageServer = null;
		StorageClient storageClient = new StorageClient(trackerServer, storageServer);
		// 定义上传文件元数据
		NameValuePair[] metaList = new NameValuePair[3];
		metaList[0] = new NameValuePair("fileName", imgFile.getName());
		metaList[1] = new NameValuePair("FileExtName", fileExtName);
		metaList[2] = new NameValuePair("fileLength", String.valueOf(imgFile.length()));
		// 如果要上传则使用trackerClient对象完成
		String[] upload_file = storageClient.upload_file(imgFile.getPath(), fileExtName, metaList);
		System.out.println(Arrays.toString(upload_file));
		trackerServer.close();
	}
}
