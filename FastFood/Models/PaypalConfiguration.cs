using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PayPal.Api;

namespace FastFood.Models
{
    public static class PaypalConfiguration
    {
     
            public readonly static string ClientId;
            public readonly static string ClientSecret;

            static PaypalConfiguration()
            {
                var config = GetConfig();
                ClientId = config["clientId"];
                ClientSecret = config["clientSecret"];
            }
            //lấy thuộc tính từ  web.config
            public static Dictionary<string, string> GetConfig()
            {
                return PayPal.Api.ConfigManager.Instance.GetProperties();
            }
            private static string GetAccessToken()
            {
                // lấy accesstoken từ paypal
                string accessToken = new OAuthTokenCredential(ClientId, ClientSecret, GetConfig()).GetAccessToken();
                return accessToken;
            }
            public static APIContext GetAPIContext()
            {
                //gọi accesstoken trả về đối tượng apicontext 
                APIContext apiContext = new APIContext(GetAccessToken());
                apiContext.Config = GetConfig();
                return apiContext;
            }
        
    }
}