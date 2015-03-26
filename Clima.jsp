<!--

@slyfunky

#######################################################################
# Helps
http://www.vogella.com/tutorials/JavaRegularExpressions/article.html
https://docs.oracle.com/javase/7/docs/api/java/util/regex/Pattern.html
http://en.wikipedia.org/wiki/Regular_expression
#######################################################################

-->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.net.URL" %>
<%@page import="java.net.URLConnection" %>
<%@page import="java.io.IOException" %>
<%@page import="java.io.InputStream" %>
<%@page import="java.io.InputStreamReader" %>
<%@page import="java.io.BufferedReader" %>
<%@page import="java.util.regex.Matcher" %>
<%@page import="java.util.regex.Pattern" %>

<%!

public static String getClima() //throws Exception
{
    try
    {
        URL url = new URL("http://www.rssweather.com/wx/br/porto+alegre+aero-porto/wx.php");
        
        URLConnection rq = url.openConnection();
        rq.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2");
        
        InputStream resposta = rq.getInputStream();
        
        BufferedReader leitor = new BufferedReader(new InputStreamReader(resposta));
        
        String linha = leitor.readLine();
        String info = "";

        String regex = "Temperature:\\s(\\d+.*?).+humidity\">(\\d+.*?)<.+windspeed\">(\\d+.*?)\\sKMH.+winddir\">(.*?)\\s.+pressure\">\\s(.*?)\\s</dd>.+dewpoint\">(\\d+.*?)&.+heatindex\">(\\d+.*?)&.+visibility\">\\s(\\d+.*?)\\skm.+<dd>(.*?)\\sAM.+<dd>(.*?)\\sPM.+time\">Updated:(.*?)</p>";
        //String regex = "Temperature:\\s(\\d+.*?).+humidity\">(\\d+.*?)<.+windspeed\">(.*?)</dd>.+pressure\">\\s(.*?)\\s</dd>.+dewpoint\">(\\d+.*?)&.+heatindex\">(\\d+.*?)&.+visibility\">\\s(\\d+.*?)\\skm.+<dd>(.*?)\\sAM.+<dd>(.*?)\\sPM.+time\">Updated:(.*?)</p>";
        
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(linha);
        int n;
        for (n = 0; n < m.groupCount(); n++)
        {
            if ((m.find() == true))
            {
                info += ("\n Temperatura: " +m.group(1) + "°C" );
                info += ("\n </br>" );
                info += ("\n (Mín: "+m.group(6) + "°C" + ", Máx: "+m.group(7) + "°C)");
                info += ("\n </br>\n </br>");
                
                //info += ("\n Condicões do vento: " +m.group(3) );
                //info += ("\n </br>\n </br>");
                
                info += ("\n\n Vento ");
                info += ("\n </br>");
                info += ("\n (Velocidade: " +m.group(3) + " km/h)");
                info += ("\n </br>");
                info += ("\n (Direção: " +m.group(4) + ")");
                info += ("\n </br>\n </br>");
                
                info += ("\n\n Pressão atmosférica: " +m.group(5)+ "ar" );
                info += ("\n </br>");
                
                info += ("\n Umidade: " +m.group(2) );
                info += ("\n </br>");
                
                info += ("\n\n Visibilidade: " +m.group(8) + " km");
                info += ("\n </br>\n </br>");
                
                info += ("\n Amanhecer: " +m.group(9) + " AM");
                info += ("\n </br>");
                info += ("\n Anoitecer: " +m.group(10) + " PM");
                info += ("\n </br>\n </br>");
                
                info += ("\n\n [Info] " +m.group(11));
            }    
        }
        return info.toString();
    }
    catch (Exception ex)
    {
        return "<p>Error: <br/>" + ex.toString() + "</p>";
    }
     
}

%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8"/>
      <title>Porto Alegre</title>
   </head>
   <body>
      <%= getClima() %>
   </body>
</html>

<!--

# Regex
Temperature:\s(\d+.*?)
humidity">(\d+.*?)<
windspeed">(\d+.*?)\sKMH
winddir">(.*?)\s
pressure">\s(.*?)\s</dd>
dewpoint">(\d+.*?)&
heatindex">(\d+.*?)&
visibility">\s(\d+.*?)\skm
<dd>(.*?)\sAM
<dd>(.*?)\sPM
time">Updated:(.*?)</p>

# RSS
http://www.rssweather.com/
Country: Brazil
State: RS
City: Porto Alegre

-->
