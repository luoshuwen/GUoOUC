using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;
using System.Drawing;
using System.Web.Security;

public partial class imagecode : System.Web.UI.Page
{
    private string generatecheckcode()
    {
        int number;
        char code;
        string checkcode = string.Empty;
        Random random = new Random();
        for (int i = 0; i < 4; i++)
        {
            number = random.Next();
            code = (char)('0' + (char)(number % 10));
            checkcode += code.ToString();
        }
        Response.Cookies.Add(new HttpCookie("checkcode", checkcode));
        return checkcode;
    }
    private void createcheckcodeimage(string checkcode)
    {
        if (checkcode == null || checkcode.Trim() == String.Empty)
        {
            return;
        }
        System.Drawing.Bitmap image = new System.Drawing.Bitmap((int)Math.Ceiling((checkcode.Length * 12.5)), 22);
        Graphics g = Graphics.FromImage(image);
        try
        {
            Random random = new Random();
            g.Clear(Color.White);
            for (int i = 0; i < 2; i++)
            {
                int x1 = random.Next(image.Width);
                int x2 = random.Next(image.Width);
                int y1 = random.Next(image.Height);
                int y2 = random.Next(image.Height);
                g.DrawLine(new Pen(Color.Black), x1, y1, x2, y2);

            }
            Font font = new System.Drawing.Font("Arial", 12, (System.Drawing.FontStyle.Bold));
            System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2f, true);
            g.DrawString(checkcode, font, brush, 2, 2);
            for (int i = 0; i < 100; i++)
            {
                int x = random.Next(image.Width);
                int y = random.Next(image.Height);
                image.SetPixel(x, y, Color.FromArgb(random.Next()));

            }
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
            Response.ClearContent();
            Response.ContentType = "image/Gif";
            Response.BinaryWrite(ms.ToArray());
        }
        finally
        {
            g.Dispose();
            image.Dispose();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        createcheckcodeimage(generatecheckcode());
    }
}