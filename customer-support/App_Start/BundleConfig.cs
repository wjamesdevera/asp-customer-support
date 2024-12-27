using System.Web;
using System.Web.Optimization;

namespace customer_support
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new Bundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/Site.css"));

            bundles.Add(new StyleBundle("~/Content/auth-css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/Auth.css"));

            bundles.Add(new StyleBundle("~/Content/analytics-css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/Analytics.css"));


            bundles.Add(new ScriptBundle("~/bundles/auth-app").Include(
                "~/Scripts/app/login/validation.js",
                "~/Scripts/app/login/login.module.js",
                "~/Scripts/app/login/login.service.js",
                "~/Scripts/app/login/login.controller.js"
                ));

            bundles.Add(new ScriptBundle("~/bundles/angularjs").Include("~/Scripts/angular.min.js"));
            bundles.Add(new ScriptBundle("~/bundles/core-app").Include(
                "~/Scripts/app/app.module.js",
                "~/Scripts/app/app.service.js",
                "~/Scripts/app/app.controller.js"
                ));

            bundles.Add(new ScriptBundle("~/bundles/analytics-app").Include(
                "~/Scripts/app/analytics/analytics.module.js",
                "~/Scripts/app/analytics/analytics.service.js",
                "~/Scripts/app/analytics/analytics.controller.js"
                ));
        }
    }
}
