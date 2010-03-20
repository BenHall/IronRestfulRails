using System.Collections.Generic;
using NHibernate.Cfg;
using NHibernate;
using NHibernate.Criterion;

namespace NHib.DataAccess
{
    public class PostRepository
    {
        ISessionFactory sessionFactory;
        public PostRepository()
        {
            sessionFactory = new Configuration()
                        .Configure("nhibernate.xml")
                        .BuildSessionFactory();
        }

        public IList<Post> GetAllPosts()
        {
            ISession session = sessionFactory.OpenSession();

            IList<Post> posts = session.CreateCriteria(typeof(Post)).List<Post>();
            session.Close();
            return posts;
        }

        public Post GetPost(string key, object val)
        {
            ISession session = sessionFactory.OpenSession();

            Post post = session.CreateCriteria(typeof(Post))
                                  .Add(Expression.Eq(key, val))
                                  .UniqueResult<Post>();
            session.Close();
            return post;
        }

        public void Insert(Post post)
        {
            ISession session = sessionFactory.OpenSession();
            session.SaveOrUpdate(post);
            session.Close();
        }
    }
}
