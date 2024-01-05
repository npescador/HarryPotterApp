struct Movie: Decodable, Identifiable {
    let id:String
    let movieAttributes: MovieAttributes
    
    enum CodingKeys: String, CodingKey {
        case id
        case movieAttributes = "attributes"
    }
    
    
    static var example: Movie {
        .init(id: "f1dcffcc-94d6-4cd8-a8ea-653e52cccc9f", movieAttributes: .init(
            box_office: "$1.018 million",
            budget: "$125 million",
            cinematographers: [""],
            directors: [""],
            distributors: [""],
            editors: [""],
            music_composers: [""],
            poster: "https://www.wizardingworld.com/images/products/films/rectangle-1.png",
            producers: [""],
            rating: "PG",
            release_date: "2001-11-04",
            running_time: "152 minutes",
            screenwriters: [""],
            slug: "harry-potter-and-the-philosopher-s-stone",
            summary: "Harry Potter’s dull life is completely changed on his eleventh birthday when a mysterious letter addressed to him arrives in the mail. After finding out about his real parents and a whole hidden wizarding world, he goes on to Hogwarts, his new magical school. From battling a troll to flying on broomsticks to catch golden snitches, Harry’s new life promises to be full of joy and adventure, until he finds out about a certain Dark Lord who murdered his parents is trying to regain power. With his friends Hermione and Ron, Harry sets out to find the philosopher’s stone before Voldemort to prevent his return. After advancing through a particularly difficult set of traps designed by the school, Harry faces the Dark Lord and manages to keep the Philosopher’s Stone safe.",
            title: "Harry Potter and the Philosopher's Stone",
            trailer: "https://www.youtube.com/watch?v=PbdM1db3JbY",
            wiki: "https://harrypotter.fandom.com/wiki/Harry_Potter_and_the_Philosopher's_Stone_(film)"
        ))
    }
}

struct MovieAttributes: Decodable {
    
    let box_office: String    //Los ingresos que esta película generó a través de la venta de entradas.    ✅
    let budget: String        //El presupuesto de esta película.    ✅
    let cinematographers: [String] //Una lista de directores de fotografía de esta película.    ✅
    let directors: [String]    //Una lista de personas que dirigieron esta película.    ✅
    let distributors: [String]    //Una lista de personas que distribuyeron esta película.    ✅
    let editors: [String]    //Una lista de personas que editaron esta película.    ✅
    let music_composers: [String]   //Una lista de personas que compusieron la música de esta película.    ✅
    let poster: String    //Un enlace al cartel de esta película.    ❌
    let producers: [String]   //Una lista de personas que produjeron esta película.    ✅
    let rating: String     //La edad recomendada de esta película.    ✅
    let release_date: String    //La fecha en que se estrenó esta película.    ✅
    let running_time: String      //El tiempo de ejecución de esta película.    ✅
    let screenwriters: [String]       //Una lista de guionistas de esta película.    ✅
    let slug: String       //Un slug para identificar esta película.    ❌
    let summary: String    //El resumen de esta película.    ✅
    let title: String        //El título de esta película.    ✅
    let trailer: String        //Un enlace al avance de esta película.    ❌
    let wiki: String        //Un enlace a la página Wiki de Harry Potter de esta película.    ❌
}
