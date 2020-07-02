using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Piranha.Manager.Models;
using Piranha.Manager.Services;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Piranha.Manager.Controllers
{
    [Area("Manager")]
    [Route("manager/api/loginuser")]
    [Authorize(Policy = Permission.Admin)]
    [ApiController]
    public class LoginApiController : Controller
    {
        private readonly IApi _api;
        private readonly LoginService _service;
        private readonly ManagerLocalizer _localizer;

        public LoginApiController(IApi api, LoginService service, ManagerLocalizer localizer)
        {
            _api = api;
            _service = service;
            _localizer = localizer;
        }

        [Route("list/{siteId?}")]
        [HttpGet]
        public async Task<LoginListModel> List(Guid? siteId = null)
        {
            var list = await _service.GetList(siteId);
            return list;
        }


        [Route("save")]
        [HttpPost]
        public async Task<IActionResult> Save(LoginListModel.ListItem model)
        {
            try
            {
                await _service.Save(model);

                var result = await _service.GetList(model.SiteId);

                result.Status = new StatusMessage
                {
                    Type = StatusMessage.Success,
                    Body = _localizer.Alias["The UserLogin was successfully added to the list"]
                };

                return Ok(result);
            }
            catch (ValidationException e)
            {
                var result = new LoginListModel();
                result.Status = new StatusMessage
                {
                    Type = StatusMessage.Error,
                    Body = e.Message
                };
                return BadRequest(result);
            }
        }


        [Route("delete/{id:Guid}")]
        [HttpGet]
        public async Task<IActionResult> Delete(Guid id)
        {
            var userlogins = await _service.Delete(id);

            if (userlogins != null)
            {
                var result = await _service.GetList(userlogins.SiteId);

                result.Status = new StatusMessage
                {
                    Type = StatusMessage.Success,
                    Body = _localizer.Alias["The UserLogin was successfully deleted"]
                };

                return Ok(result);
            }
            return NotFound();
        }
    }
}
