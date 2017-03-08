//
//  ApplicationData.swift
//  Test
//
//  Created by WuQiang on 2017/3/8.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

struct ApplicationData {
    var items: [String]
    var itemsData: [String: [String]]
    
    init() {
        items = ["book1", "book2", "book3", "book4", "book5", "book6", "book7", "book8", "book9", "book10", "book11", "book12"]
        itemsData = ["book1": ["Steve Jobs", "Walter Isaacson"], "book2": ["HTML5 for Masterminds", "J.D Gauchat"], "book3": ["The Road Ahead", "Bill Gates"], "book4": ["The C Programming Language", "Brian W. Kernighan"], "book5": ["Being Digital", "Nicholas Negroponte"], "book6": ["Only the Paranoid Survive", "Andrew S. Grove"], "book7": ["Accidental Empires", "Robert X. Cringely"], "book8": ["Bobby Fischer Teaches Chess", "Bobby Fischer"], "book9": ["New Guide to Science", "Isaac Asimov"], "book10": ["Christine", "Stephen King"], "book11": ["IT", "Stephen King"], "book12": ["Ending Aging", "Aubrey de Grey"]]
    }
}
var AppData = ApplicationData()
