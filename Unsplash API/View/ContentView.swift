import SwiftUI

struct ContentView: View {
    
    @ObservedObject var searchObjectContoller = SearchObjectController()
    @State var favourite: [Result] = []
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List(filteredResults, id: \.id) { result in
                VStack {
                    ImageSection(result: result)
                        .contentShape(Rectangle()) // Prevents tap conflicts
                    
                    Spacer()
                    
                    FavouriteButton(result: result, favourite: $favourite)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: FavouriteScreen(result: favourite)) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .onAppear {
                searchObjectContoller.search()
            }
            .navigationTitle("Unsplash API")
        }
    }
    
    // Filter results based on search text
    private var filteredResults: [Result] {
        if searchText.isEmpty {
            return searchObjectContoller.results
        } else {
            return searchObjectContoller.results.filter { result in
                result.description?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }
}

struct ImageSection: View {
    let result: Result

    var body: some View {
        NavigationLink(destination: DetailScreen(result: result)) {
            if let urlString = result.urls.small, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                        .aspectRatio(2/3, contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                } placeholder: {
                    ProgressView()
                        .scaleEffect(2)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .buttonStyle(PlainButtonStyle()) // Prevents extra button styling that causes conflicts
    }
}

struct FavouriteButton: View {
    let result: Result
    @Binding var favourite: [Result]

    var body: some View {
        Button {
            toggleFavourite()
        } label: {
            Image(systemName: isFavourite ? "heart.fill" : "heart")
                .font(.title)
                .foregroundColor(.red)
                .padding()
                .background(Circle().fill(Color.white.opacity(0.7)))
        }
        .buttonStyle(PlainButtonStyle()) // Prevents unwanted button styling effects
    }

    private var isFavourite: Bool {
        favourite.contains { $0.id == result.id }
    }

    private func toggleFavourite() {
        if let index = favourite.firstIndex(where: { $0.id == result.id }) {
            favourite.remove(at: index)
        } else {
            favourite.append(result)
        }
    }
}

#Preview {
    ContentView()
}
