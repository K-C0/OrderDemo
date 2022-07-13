package org.wdl.hotelAppTest.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓



    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id ="2021000121623274";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCsk/kxmgU/NnBbFYyPAfLZPuHSGD/VDR+tni+9iRhOWxSmgU8GXTuevIxW/fITC1fGf5rb86oc/KM+gIPz6FFvN2bOJhskxDS77N2tA2vX8Z6VG6JBPsyk/KmslbGaiNU/mdynsd+wyqwUWY8v9PToYPAxsJVTbrlttsum/ulwcJsY0tTY1xDYhj3nqovxF/qp/At0CNN0HttK4NxWd7kiDOd/b1sNXpw5+G7OLudnVROpZXwM532818uSkp9UaRgMLR4xhmv0gGBxXy6Y23avi8YuFUOrwrwJEdyRqSohgtTDwAWTKwtyANOLhC8rVyT4uLcyFpYZYlXSu1wfuXjJAgMBAAECggEAYcN52XWNH2AxigfNFn5eGl+bAa+nCYRju7DvDooJcOn76s85+zr5uVTKk8VMSymT0ekbyxpf9gfQWmnnVlb3Ou/Bl2rS2aMk1Ii8k3RqtWw1D/cVlayDtbtES3aJpCd71onNDFqhg79seCK8EMjNrI6twxhrn1YMSXDSMYoaqAzR5RfSNE8KPgAanWeuzN6uzjf5ixiMd53INyQOlM7+rjW4sCQwE0t0VFPqeDdd6sqaOtSgWlCz0/pVwpPea+dcbPiexWZYLduCBHiANxO3JbC+jP7siZ8zDEbW8yPYpBaQi+ChslMHkNdsVDwlRdHsV+6YH0VEUO2ENvjoEgESeQKBgQDyNMJQYJhTh5ir2itwdoQUbRUv3x9u2MzyLlMijYDL8o8czyaGTvQS6MXLSyVC2GZrKCZnM3k4IaZJWszVZauselDVkNIsjM5ZTDOo2EMcYudJZlT366wl1rdr/4uHymQ21s6A5rTBAyzGtUrjH2tusGRfXIkymrzAripir0rG5wKBgQC2aBKeVyp9n2jUQJbzSdSfRxL2bNWz4CJ8JLrPXJzSCWl4uvrsxWXH+Hq7XoG7mg7TRjcvVcohxdjyCrFbjU8Tv0fJDFkUQISIXadjKu/hweg2dl/0wPV4XuKBfgffp611WYnXZgbuIalb/CjD47ZMge1vauJUWdqZwmivHSe8zwKBgBHjI5acC6Pfl77ZVevwVMDNbYsjh0bAbCJWmX0rxh9Jwpf2FHpGym+7ESB6ZD4TjTzMsklc287xbT5tnkMERzFttxqOn3b6zyJ5JjeKASrPgxVAoXXNyeDhgppPPRbCM7R5GLccUq0OdvgV23n6kAyUqlUAmIFMPDReqHKxT2xxAoGAPbXf9qnOuklgEc74Qr7LrEdDZxNTCVPe1tkmSlkuxPBiOnInykrOMGUkQJeslGd+dIPgz6bah6qDxv9PGYYpJqkkBCSlTnC1Zd0pcCdqmJodka9ir09IvLx9LQoSZ9w2luj/9VuTJKVGwtQAhqVXW3LpfTRP9fGgPzzCZdwbQYkCgYBeLL92glMxYS/xLLH8tz3HffuMsiHojjLp0ea22ldlsvvvCic79aHatUqcghDLY70Fd5j8RRcw3egCgHHKtYI76k583pkvz7yJ/nfvAEDtxn32V59CuMQxa3FYqA9DIAkxIekZpFrszw1+rWJInE0sWfXfgYWB97mg9qtQr8keOg==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArJP5MZoFPzZwWxWMjwHy2T7h0hg/1Q0frZ4vvYkYTlsUpoFPBl07nryMVv3yEwtXxn+a2/OqHPyjPoCD8+hRbzdmziYbJMQ0u+zdrQNr1/GelRuiQT7MpPyprJWxmojVP5ncp7HfsMqsFFmPL/T06GDwMbCVU265bbbLpv7pcHCbGNLU2NcQ2IY956qL8Rf6qfwLdAjTdB7bSuDcVne5Igznf29bDV6cOfhuzi7nZ1UTqWV8DOd9vNfLkpKfVGkYDC0eMYZr9IBgcV8umNt2r4vGLhVDq8K8CRHckakqIYLUw8AFkysLcgDTi4QvK1ck+Li3MhaWGWJV0rtcH7l4yQIDAQAB";

    //	 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
//	public static String notify_url = "http://150.158.191.108:8080/OrderSystem/cartInfo/success";
    public static String notify_url = "http://localhost:8080/app/index.do";

    /*z注意路径要切换*/
    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
//	public static String return_url = "http://150.158.191.108:8080/OrderSystem/indexInfo/findIndexAll";
    public static String return_url = "http://localhost:8080/app/index.do";

    // 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

