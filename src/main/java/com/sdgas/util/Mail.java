package com.sdgas.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * Created by 120378 on 2014-10-30.
 */
public class Mail {

/*    private final static String smtp = "smtp.126.com"; // 发送邮件服务器
    private final static String user = "sd_gas"; // 邮件服务器登录用户名，（qq帐号）
    private final static String password = "sditor@"; // 邮件服务器登录密码
    private final static String from = "sd_gas@120.com"; // 发送人邮件地址*/
    private final static String smtp = "smtp.qq.com"; // 发送邮件服务器
    private final static String user = "476288644"; // 邮件服务器登录用户名，（qq帐号）
    private final static String password = "hebin661683"; // 邮件服务器登录密码，（qq密码）
    private final static String from = "476288644@qq.com"; // 发送人邮件地址，（qq邮箱）

	/*
	 * 注意点1：发送人邮件地址必须是邮件服务器登录用户名下注册的邮箱，否则会报SMTPSendFailedException: 501 mail
	 * from address must be same as authorization user异常
	 */

    /**
     * @param to
     *            接收方的邮件地址
     * @param title
     *            邮件的标题
     * @param content
     *            邮件内容
     * @param type
     *            邮件格式
     */
    public static void sendMail(String to, String title, String content,
                                String type) {
		/* 以下为发送程序 */
        // 设置邮件的属性
        Properties props = new Properties();
        props.put("mail.smtp.host", smtp);// 存储发送邮件服务器的信息
        props.put("mail.smtp.auth", "true");// 通过验证
        props.setProperty("mail.smtp.port", "587");// 服务器端口号
        props.setProperty("mail.smtp.socketFactory.port", "587");// 服务器SSL端口号
        Session ssn = Session.getInstance(props, null);
        ssn.setDebug(true);// 设置为调试状态
        // 设置各种邮件头字段
        MimeMessage message = new MimeMessage(ssn);
        InternetAddress fromAddress;
        try {
            fromAddress = new InternetAddress(from);
            // 设置发件人
            message.setFrom(fromAddress);
            InternetAddress toAddress = new InternetAddress(to);
            // 设置收件人
            message.addRecipient(Message.RecipientType.TO, toAddress);
            // 邮件主题
            message.setSubject(title);
            // 邮件内容（html格式）
            if ("html".equals(type)) {
                // 创建保存邮件正文的对象
                MimeMultipart mbp = new MimeMultipart("related");
                MimeBodyPart htmlmbp = new MimeBodyPart();
                // 设定邮件内容的类型为 text/plain 或 text/html
                htmlmbp.setContent(content, "text/html;charset=UTF-8");

                mbp.addBodyPart(htmlmbp);

				/*
				 * 附图
				 */
				/*
				MimeBodyPart imgmbp = new MimeBodyPart();
				// 设定邮件内容的类型为 图片格式
				imgmbp.setDataHandler(new DataHandler(new FileDataSource(
						"d:/1.jpg")));
				imgmbp.setContentID("1.jpg");

				mbp.addBodyPart(imgmbp);*/

                message.setContent(mbp);
            }
            // 默认为文本格式
            else {
                // 发送文本邮件
                message.setText(content);
            }
            message.setSentDate(new Date());// 设置发信时间
            Transport transport = ssn.getTransport("smtp");
            transport.connect(smtp, user, password);
            transport.sendMessage(message, message.getAllRecipients());
            // transport.send(message);
            transport.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*public static void main(String[] args) {
        Mail.sendMail("willsonbin@163.com", "系统测试", "<b>系统测试</b>", "html");
    }*/
}
