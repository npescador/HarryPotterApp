protocol BooksRemoteService {
    func getBooks() async throws -> [Book]
}
