/*
 * Copyright (c) .NET Foundation and Contributors
 *
 * This software may be modified and distributed under the terms
 * of the MIT license.  See the LICENSE file for details.
 *
 * http://github.com/tidyui/coreweb
 *
 */

using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Piranha;
using Microsoft.OpenApi.Models;
using Piranha.Data.EF.SQLServer;
using Microsoft.Extensions.Configuration;
using Piranha.AspNetCore.Identity.SQLServer;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace MvcWeb
{
    public class Startup
    {
        public IConfiguration Configuration { get; private set; }

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddLocalization(options =>
                options.ResourcesPath = "Resources"
            );
            services.AddControllersWithViews();
            services.AddRazorPages()
                .AddPiranhaManagerOptions();

            services.AddPiranha();
            services.AddPiranhaApplication();
            services.AddPiranhaFileStorage();
            services.AddPiranhaImageSharp();
            services.AddPiranhaManager();
            services.AddPiranhaSummernote();
            //services.AddPiranhaTinyMCE();
            services.AddPiranhaApi();

            services.AddPiranha(options =>
            {
                options.UseEF<SQLServerDb>(db => db.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));
            });
            services.AddPiranhaIdentityWithSeed<IdentitySQLServerDb>(options =>
                options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

            services.AddMemoryCache();
            services.AddPiranhaMemoryCache();

            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v1", new OpenApiInfo { Title = "PiranhaCMS API", Version = "v1" });
                options.CustomSchemaIds(x => x.FullName);
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, IApi api)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();

                // Enable middleware to serve swagger-ui (HTML, JS, CSS, etc.),
                // specifying the Swagger JSON endpoint.
                app.UseSwaggerUI(options =>
                {
                    options.SwaggerEndpoint("/swagger/v1/swagger.json", "PiranhaCMS API V1");
                });
            }

            App.Init(api);

            // Configure cache level
            App.CacheLevel = Piranha.Cache.CacheLevel.Full;

            // Build content types
            var pageTypeBuilder = new Piranha.AttributeBuilder.PageTypeBuilder(api)
                .AddType(typeof(Models.TeaserPage))
                .AddType(typeof(Models.RelationPage))
                .AddType(typeof(Models.ContactPage))
                .AddType(typeof(Models.IntroPage))
                .AddType(typeof(Models.ServicesPage))
                .AddType(typeof(Models.InvestbankPage))
                .AddType(typeof(Models.AgencyPage))
                .AddType(typeof(Models.NewsPage))
                .AddType(typeof(Models.RequestOpenAccPage))
                .AddType(typeof(Models.CategoryPage))
                .AddType(typeof(Models.RecruitPage))
                .AddType(typeof(Models.LoginPage))
                .AddType(typeof(Models.RegisterPage))
                .AddType(typeof(Models.SearchPage))
                .AddType(typeof(Models.ForgotPassword))
                .Build()
                .DeleteOrphans();
            var postTypeBuilder = new Piranha.AttributeBuilder.PostTypeBuilder(api)
                .AddType(typeof(Models.NewsPost))
                .Build()
                .DeleteOrphans();
            var siteTypeBuilder = new Piranha.AttributeBuilder.SiteTypeBuilder(api)
                .AddType(typeof(Models.StandardSite))
                .Build()
                .DeleteOrphans();

            /**
             *
             * Test another culture in the UI
             *
            var cultureInfo = new System.Globalization.CultureInfo("en-US");
            System.Globalization.CultureInfo.DefaultThreadCurrentCulture = cultureInfo;
            System.Globalization.CultureInfo.DefaultThreadCurrentUICulture = cultureInfo;
             */

            // Register middleware
            app.UseStaticFiles();
            app.UsePiranha();
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UsePiranhaIdentity();
            app.UsePiranhaManager();
            app.UsePiranhaSummernote();
            //app.UsePiranhaTinyMCE();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");

                endpoints.MapPiranhaManager();
            });

            //Seed.RunAsync(api).GetAwaiter().GetResult();
        }
    }
}
