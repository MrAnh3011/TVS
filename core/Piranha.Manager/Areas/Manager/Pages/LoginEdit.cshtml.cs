using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Piranha.Manager.Models
{
    [Authorize(Policy = Permission.Aliases)]
    public class LoginEditViewModel : PageModel
    {
    }
}
