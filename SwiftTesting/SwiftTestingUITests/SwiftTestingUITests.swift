//
//  SwiftTestingUITests.swift
//  SwiftTestingUITests
//
//  Created by Melike Yayla on 20.04.2023.
//

import XCTest

final class SwiftTestingUITests: XCTestCase {

    
    func testToDoItem() throws {
        let app = XCUIApplication()
        app.launch()

        let addButton = app.navigationBars["SwiftTesting.View"].buttons["Add"]
        
        let elementsQuery = app.alerts["Ad İtem"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews.textFields["Enter Item"]
        let okButton = elementsQuery.buttons["OK"]
        let addedCell = app.tables.cells.containing(.staticText, identifier: "kursu bitir").element
                
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okButton.tap()
        
        XCTAssertTrue(addedCell.exists)
    }

    func testDeleteItem() throws {
        let app = XCUIApplication()
        app.launch()
        
        let addButton = app.navigationBars["SwiftTesting.View"].buttons["Add"]
        
        let elementsQuery = app.alerts["Ad İtem"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews.textFields["Enter Item"]
        let okButton = elementsQuery.buttons["OK"]
        let addedCell = app.tables.cells.containing(.staticText, identifier: "kursu bitir").element
        
        //tables
        
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["delete"]
        
        
        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okButton.tap()
        
        addedCell.swipeLeft()
        deleteButton.tap()
        
        XCTAssertFalse(addedCell.exists)
        
        
    }
  
}

