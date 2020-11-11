# The Schema for Cloud Firestore

## About

Even though Cloud Firestore is a NOSQL DB, it's still a good idea to have a schema :)

We plan to use the same DB for both Pryzl and Pryzl for business. And we use Firebase storage for images/files/etc.

## Schema

```json
users: {
  userName: {
    email: string,
    followingCounter: integer, // snippet that is updated by Cloud Function
    followersCounter: integer, // snippet that is updated by Cloud Function
    name: string,
    phoneNumber: string,
    profilePictureUrl: string,  // Firebase Storage
    userName: string,
    creationDate: timestamp,
    preferences: <string>[],

    auth: { // subcollection
      password: string,
      salt: string,
      authenticationMethod: 'traditional' | 'facebook'
    },

    delivery: { // subcollection
      address_1: {
        street: string,
        postCode: string,
        city: string,
        floor: string,
        delivery_notes: string,
        ...
      }
    },

    payment: { // subcollection
      payment_1: {
        method: string,
        ...
      }
    },

    userFollowing: { // subcollection
      userId
    },

    userFollowers: { // subcollection
      userId
    },

    checkIns: { // subcollection
      restaurant_id {
        note: string,
        quality : double,
        service : double,
        ambience : double,
        cleanliness : double,
        price : double,
        overall : double
      }
    }
  }
},

posts: {
  postId: {
    postId: string,  // UUID
    userId: string,  // UUID
    imageUrl: string,  // Firebase Storage
    description: string,
    likesCounter: integer, // snippet that is updated by Cloud Function
    postDate: timestamp,

    comments: { // subcollection
      commentId: {
        commentId: string,
        commentDate: timestamp
        ...
      }
    }
  }
},

review: {
  reviewId: {
    reviewId: string, // UUID
    restarauntId: string, // UUID
    userId: string, // UUID
    rating: PryzRating, // enum
    comment: string,
    upvotes: integer,
    imageUrl: string,
    reviewDate: timestamp
  }
}

feed: { // updated by Cloud Function when following or unfollowing a new user
  feedUserId: {
    feedPosts: { // subcollection
      postdId
    }
  }
}

likes: {
  postId: {
    postId: string, // UUID
    userId: string, // UUID
    type: 'posts' | ...,
    likeDate: timestamp
  }
}

restaraunts: {
  restarauntId: {
    restarauntId: string, // UUID

    reviews: { // subcollection

    }
  }
}

orders: {
  orderId: {
    orderId: string, // UUID
    userId: string, // UUID
    restarauntId: string, // UUID
  }
},

menus: {

},

```
