using Newtonsoft.Json;

namespace NHib.DataAccess
{
    public class Post
    {
        public virtual int PostID { get; set; }
        public virtual string Title { get; set; }

        public virtual string ToJson(object o)
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}