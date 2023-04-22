//
//  AddViewModel.swift
//  Diary
//
//  Created by Карим Садыков on 21.04.2023.
//

import Foundation

class AddViewModel {
    var coordinator: AddCoordinator?
    let taskManager = TaskManager()
    var task: Task?
    
    func addTask(name: String, description: String, startDate: Date, repetitionsPerDay: Int) throws {
        let newTask = Task()
        newTask.name = name
        newTask.taskDescription = description
        newTask.startDate = startDate
        newTask.repetitionsPerDay = repetitionsPerDay
        if task != nil {
            try taskManager.editTask(task!, withName: name, taskDescription: description, startTime: startDate, startDate: Date(), repetitionsPerDay: repetitionsPerDay)
        } else {
            try taskManager.addTask(newTask)
        }
    }

}