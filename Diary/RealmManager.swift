//
//  RealmManager.swift
//  Diary
//
//  Created by Карим Садыков on 19.04.2023.
//

import RealmSwift

class TaskManager {
    let realm = try! Realm()
    
    // добавление новой задачи
    func addTask(_ task: Task) throws {
        do {
            try realm.write {
                realm.add(task)
            }
        } catch {
            throw error
        }
    }
    
    // удаление задачи
    func removeTask(_ task: Task) throws {
        do {
            try realm.write {
                realm.delete(task)
            }
        } catch {
            throw error
        }
    }
    
    // изменение задачи
    func editTask(_ task: Task, withName name: String?, taskDescription: String?, startDate: Date?, repetitionsPerDay: Int?) throws {
        do {
            try realm.write {
                if let name = name {
                    task.name = name
                }
                if let taskDescription = taskDescription {
                    task.taskDescription = taskDescription
                }
                if let startDate = startDate {
                    task.startDate = startDate
                }
                if let repetitionsPerDay = repetitionsPerDay {
                    task.repetitionsPerDay = repetitionsPerDay
                }
            }
        } catch {
            throw error
        }
    }
    
    // получение всех задач
    var allTasks: Results<Task> {
        return realm.objects(Task.self)
    }
}
