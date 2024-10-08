//
//  ContentView.swift
//  Convene: Wuwa
//
//  Created by Mila Masaya on 8/25/24.
//

import SwiftUI
import Defaults
import SFSafeSymbolls
import SwiftData

struct ContentView: View {
    // MARK: Internal
    @MainActor var body: some View {
        NavigationSplitView {
            List{
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationSplitViewColumnWidth(min: 180, ideal:200)
            .toolbar {
                Toolbaritem {
                    button(action: additem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    // MARK: Private

    @Environment(\.modelContext) private var modelContext
    @Query private var irems: [Item]

    private func addItem() {
        withAnimation {
            let new Item = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    #Preview
        DemoContentView()
        .modelContainer(for: Item.self, inMemory: true
)
