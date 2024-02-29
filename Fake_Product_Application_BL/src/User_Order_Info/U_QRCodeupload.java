package User_Order_Info;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.qrcode.Read_QR;
import com.qrcode.product_detection;
import com.user.DBconn;

/**
 * Servlet implementation class U_QRCodeupload
 */
@WebServlet("/U_QRCodeupload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class U_QRCodeupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String tenfilepath = null;
	private static final int BUFFER_SIZE = 4096;

	public U_QRCodeupload() {
		super();
		// TODO Auto-generated constructor stub
	}

	String getFileName(Part filePart) {

		for (String cd : filePart.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim()
						.replace("\"", "");
				return fileName.substring(fileName.lastIndexOf('/') + 1)
						.substring(fileName.lastIndexOf('\\') + 1);
				// return cd.substring(cd.indexOf('=') + 1).trim().replace("\"",
				// "") ;
			}

		}

		return null;

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession(false);
		//String emailid = (String) session.getAttribute("userid");
		Part tenfile = request.getPart("qrcodefile");
		InputStream teninputStream = null;
		String tenmsg = "qr.png";
		try {

			teninputStream = tenfile.getInputStream();
			String relativeWebPath = "/output/" + tenmsg;
			String absoluteDiskPath = getServletContext().getRealPath(
					relativeWebPath);
			File f = new File(absoluteDiskPath);
			tenfilepath = f.getAbsolutePath().toString();
			OutputStream outStream = new FileOutputStream(f);
			byte[] buffer = new byte[BUFFER_SIZE];
			int bytesRead = -1;
			while ((bytesRead = teninputStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}
			teninputStream.close();
			outStream.close();
			String data = Read_QR.readQR(tenfilepath);
			f.delete();
			System.out.println("Data read from QR Code:" + data);
			if (data.equalsIgnoreCase("Unable to scan")) {
				response.sendRedirect("U_QRCode_details.jsp?Unable");
			} else {
				String[] pdata = data.split("@0@");
				if (pdata.length < 9) {
					response.sendRedirect("U_QRCode_details.jsp?Unable");
				} else {
					String id = pdata[6];
					System.out.println("product No:" + id);
					int flag = product_detection.ProductNo(id);
					int Tch=DBconn.product_Tab_Contains_check(id,pdata[9],pdata[10],pdata[11]);
					if (flag == 1||Tch==1) {
						response.sendRedirect("QRCode_details.jsp?Fake");
					} else {
						System.out.println("\t product No:" + id);
						response.sendRedirect("U_Dist_ShowProduct.jsp?productno="
							+ id);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
