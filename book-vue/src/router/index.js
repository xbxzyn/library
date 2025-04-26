import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: '/', redirect: '/front/home' },
    {
      path: '/manager',
      component: () => import('@/views/Manager.vue'),
      children: [
        { path: 'home', meta: { name: '系统首页' }, component: () => import('@/views/manager/Home.vue'),  },
        { path: 'admin', meta: { name: '管理员信息' }, component: () => import('@/views/manager/Admin.vue'), },
        { path: 'notice', meta: { name: '系统公告' }, component: () => import('@/views/manager/Notice.vue'), },
        { path: 'person', meta: { name: '个人资料' }, component: () => import('@/views/manager/Person.vue'), },
        { path: 'password', meta: { name: '修改密码' }, component: () => import('@/views/manager/Password.vue'), },
        { path: 'category', meta: { name: '图书分类' }, component: () => import('@/views/manager/Category.vue'), },
        { path: 'book', meta: { name: '图书信息' }, component: () => import('@/views/manager/Book.vue'), },
        { path: 'postsSection', meta: { name: '社区版块' }, component: () => import('@/views/manager/PostsSection.vue'), },
        { path: 'activity', meta: { name: '图书活动' }, component: () => import('@/views/manager/Activity.vue'), },
        { path: 'room', meta: { name: '预览室信息' }, component: () => import('@/views/manager/Room.vue'), },
        { path: 'seat', meta: { name: '预览室信息' }, component: () => import('@/views/manager/Seat.vue'), },
        { path: 'user', meta: { name: '普通用户信息' }, component: () => import('@/views/manager/User.vue'), },
        { path: 'orders', meta: { name: '普通用户信息' }, component: () => import('@/views/manager/Orders.vue'), },
        { path: 'comment', meta: { name: '评论信息' }, component: () => import('@/views/manager/Comment.vue'), },
        { path: 'posts', meta: { name: '帖子信息' }, component: () => import('@/views/manager/Posts.vue'), },
        { path: 'sign', meta: { name: '活动报名' }, component: () => import('@/views/manager/Sign.vue'), },
        { path: 'collect', meta: { name: '活动收藏' }, component: () => import('@/views/manager/Collect.vue'), },
        { path: 'seatReserve', meta: { name: '座位预约' }, component: () => import('@/views/manager/SeatReserve.vue'), },
        { path: 'carousel', meta: { name: '座位预约' }, component: () => import('@/views/manager/Carousel.vue'), },
        { path: 'message', meta: { name: '反馈管理' }, component: () => import('@/views/manager/message.vue'), },

      ]
    },
    {
      path: '/front',
      component: () => import('@/views/Front.vue'),
      children: [
        { path: 'home', component: () => import('@/views/front/Home.vue'),  },
        { path: 'person', component: () => import('@/views/front/Person.vue'),  },
        { path: 'password', component: () => import('@/views/front/Password.vue'),  },
        { path: 'bookDetail', component: () => import('@/views/front/BookDetail.vue'),  },
        { path: 'orders', component: () => import('@/views/front/Orders.vue'),  },
        { path: 'cart', component: () => import('@/views/front/Cart.vue'),  },
        { path: 'posts', component: () => import('@/views/front/Posts.vue'),  },
        { path: 'postsDetail', component: () => import('@/views/front/PostsDetail.vue'),  },
        { path: 'myPosts', component: () => import('@/views/front/MyPosts.vue'),  },
        { path: 'activity', component: () => import('@/views/front/Activity.vue'),  },
        { path: 'activityDetail', component: () => import('@/views/front/ActivityDetail.vue'),  },
        { path: 'sign', component: () => import('@/views/front/Sign.vue'),  },
        { path: 'collect', component: () => import('@/views/front/Collect.vue'),  },
        { path: 'book', component: () => import('@/views/front/Book.vue'),  },
        { path: 'room', component: () => import('@/views/front/Room.vue'),  },
        { path: 'seatReserve', component: () => import('@/views/front/SeatReserve.vue'),  },
        { path: 'mySeatReserve', component: () => import('@/views/front/MySeatReserve.vue'),  },
        { path: 'myComment', component: () => import('@/views/front/MyComment.vue'),  },
        { path: 'tips', component: () => import('@/views/front/MyMessage.vue'),  },
        { path: 'feadback', component: () => import('@/views/front/MyFeedback.vue'),  },


      ]
    },
    { path: '/login', component: () => import('@/views/Login.vue') },
    { path: '/register', component: () => import('@/views/Register.vue') },
    { path: '/404', component: () => import('@/views/404.vue') },
    { path: '/:pathMatch(.*)', redirect: '/404' }
  ]
})

export default router
