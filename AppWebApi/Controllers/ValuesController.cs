using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace AppWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        /// <summary>
        /// Get this instance.
        /// </summary>
        /// <returns>The get.</returns>
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "value1", "value2" };
        }

        /// <summary>
        /// Get the specified id.
        /// </summary>
        /// <returns>The get.</returns>
        /// <param name="id">Identifier.</param>
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        /// <summary>
        /// Post the specified value.
        /// </summary>
        /// <param name="value">Value.</param>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        /// <summary>
        /// Put the specified id and value.
        /// </summary>
        /// <param name="id">Identifier.</param>
        /// <param name="value">Value.</param>
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        /// <summary>
        /// Delete the specified id.
        /// </summary>
        /// <param name="id">Identifier.</param>
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
