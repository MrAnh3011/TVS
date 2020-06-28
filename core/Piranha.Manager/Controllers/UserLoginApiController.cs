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
    [Route("manager/api/userlogin")]
    [Authorize(Policy = Permission.Admin)]
    [ApiController]
    public class UserLoginApiController : Controller
    {
        private readonly IApi _api;
        private readonly UserLoginService _service;
        private readonly ManagerLocalizer _localizer;

        public UserLoginApiController(IApi api, UserLoginService service, ManagerLocalizer localizer)
        {
            _api = api;
            _service = service;
            _localizer = localizer;
        }

        [Route("list/{siteId?}")]
        [HttpGet]
        [Authorize(Policy = Permission.UserLogins)]
        public async Task<UserLoginListModel> List(Guid? siteId = null)
        {
            return await _service.GetList(siteId);
        }


        [Route("save")]
        [HttpPost]
        [Authorize(Policy = Permission.UserLoginsEdit)]
        public async Task<IActionResult> Save(UserLoginListModel.ListItem model)
        {
            try
            {
                await _service.Save(model);

                var result = await _service.GetList(model.SiteId);

                result.Status = new StatusMessage
                {
                    Type = StatusMessage.Success,
                    Body = _localizer.Alias["The userlogin was successfully added to the list"]
                };

                return Ok(result);
            }
            catch (ValidationException e)
            {
                var result = new UserLoginListModel();
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
        [Authorize(Policy = Permission.UserLoginsDelete)]
        public async Task<IActionResult> Delete(Guid id)
        {
            var userlogins = await _service.Delete(id);

            if (userlogins != null)
            {
                var result = await _service.GetList(userlogins.SiteId);

                result.Status = new StatusMessage
                {
                    Type = StatusMessage.Success,
                    Body = _localizer.Alias["The alias was successfully deleted"]
                };

                return Ok(result);
            }
            return NotFound();
        }
    }
}
