struct Book: Decodable, Identifiable {
    let id:String
    let bookAttributes: BookAttribute
    
    enum CodingKeys: String, CodingKey {
        case id
        case bookAttributes = "attributes"
    }
    
    
    static var example: Book {
        .init(id: "6fecfd3a-4f00-4574-940e-247d968fac75", bookAttributes: .init(
            author: "J. K. Rowling",
            cover: "https://www.wizardingworld.com/images/products/books/UK/rectangle-1.jpg",
            dedication: "For Jessica, who loves stories, for Anne, who loved them too, and for Di, who heard this one first",
            pages: 223,
            release_date: "1997-06-26",
            summary: "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!",
            slug: "harry-potter-and-the-philosopher-s-stone",
            title: "Harry Potter and the Philosopher's Stone",
            wiki: "https://harrypotter.fandom.com/wiki/Harry_Potter_and_the_Philosopher's_Stone"
        ))
    }
}

struct BookAttribute: Decodable {
    let author: String
    let cover: String
    let dedication: String
    let pages: Int
    let release_date: String
    let summary: String
    let slug: String
    let title: String
    let wiki: String
}
