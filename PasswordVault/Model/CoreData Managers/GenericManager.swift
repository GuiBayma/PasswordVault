//
//  GenericManager.swift
//  PasswordVault
//
//  Created by Guilherme Bayma on 8/1/17.
//  Copyright © 2017 Bayma. All rights reserved.
//

import UIKit
import CoreData

public class GenericManager {

    internal var managedContext: NSManagedObjectContext?

    internal init() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            managedContext = appDelegate.persistentContainer.viewContext
        }
    }

    func save() -> Bool {
        do {
            try managedContext?.save()
            return true
        } catch let error as NSError {
            print("Erro ao salvar contexto: \(error)")
            return false
        }
    }

    func delete(object: NSManagedObject) -> Bool {
        managedContext?.delete(object)
        return save()
    }

}
