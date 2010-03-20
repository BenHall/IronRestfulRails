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

        public bool Insert(Post post)
        {
            ITransaction transaction = null;

            try
            {
                ISession session = sessionFactory.OpenSession();
                transaction = session.BeginTransaction();
                session.SaveOrUpdate(post);
                transaction.Commit();
                session.Close();
                return true;
            }
            catch (System.Exception)
            {
                if (transaction != null) transaction.Rollback();
                return false;
            }
        }

        public bool Delete(Post post)
        {
            ITransaction transaction = null;

            try
            {
                ISession session = sessionFactory.OpenSession();
                transaction = session.BeginTransaction();
                session.Delete(post);
                transaction.Commit();
                session.Close();
                return true;
            }
            catch (System.Exception)
            {
                if (transaction != null) transaction.Rollback();
                return false;
            }
        }
    }
}
