//this is temporary database script
interface Users {
    _id: string,
    // *
    avatar: string,
    userName: string,
    coinPoint: number,
    bookmarkList: {
        comic: [
            // ObjectId("example");
        ],
        movies: [

        ]
    },
    histories: {
        readingComic: [

        ],
        watchingMovie: [
            
        ]
    }
}

interface Comics {
    _id: string,
    //*
    coverImage: string,
    comicName: string,
    author: string,
    artist: string,
    genres: [
        // *
        // 1 comic has duplicate genres and 1 genre has many comics
        // list id of genres
    ],
    ageFor: string,
    publisher: string,
    description: string,
    newChapterTime: string,
    chapterList: [
        // use references
        // list id of comic chapter
    ],
    

}

interface ComicChapters {
    _id: string,
    //*
    coverImage: string,
    chapterName: string,
    publicTime: string,
    // *
    content: string,
    comments: [
        {
            // *
            userId: string,
            likes: [
                //list id of users have likes this comment
            ],
            replies: [
                {
                    userId: string,
                    likes: [

                    ],
                    replies: [

                    ]
                }
            ]
        }
    ],
    likes: string, // id of likerecord
    views: number,
    unlockPrice: number,
    userUnlocked: [
        // this helps us configure top unlock of week or month
    ]
}

interface AnimeMovies {
    _id: string,
    // *
    coverImage: string,
    movieName: string,
    genres: [
        // list id of genres
    ],
    publishTime: string,
    ageFor: string,
    publisher: string,
    description: string,
    episodes: [
        // list id of episodes
    ]
}

interface AnimeEpisodes {
    _id: string,
    // *
    coverImage: string,
    episodeName: string,
    totalTime: string,
    // *
    content: string,
    likes: string, // id of likerecord
    views: number,
    comments: [
        {
            // *
            userId: string
            likes: [
                //list id of users have likes this comment
            ],
            replies: [
                {
                    userId: string,
                    likes: [

                    ],
                    replies: [

                    ]
                }
            ]
        }
    ],
    // *
    advertisement: string,
}

interface LikeRecords {
    _id: string,
    record: [
        {
            userId: string,
            createdAt: Date,
        }
    ]
}

interface Genres {
    _id: string,
    genreName: string,
    comics: [

    ],
    animeMovies: [

    ]
}

interface DonatePackage {
    _id: string,
    packageName: string,
    packageValue: number,
}


// these below may be used but not corrected, just some function, task owner create the rest, thank u~~~~
interface PaymentHistory {
    // * task owner create this
}

interface DonateRanking {

}
interface ComicAlbum {

}

interface AnimeAlbum {

}
interface HomeBanner {

}
interface HotSeries {

}
