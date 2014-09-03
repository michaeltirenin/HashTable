//
//  HashTable.swift
//  HashTable
//
//  Created by Michael Tirenin on 9/2/14.
//  Copyright (c) 2014 Michael Tirenin. All rights reserved.
//

import Foundation

class HashTable {
    
    var size : Int
    var hashArray = [HashBucket]()
    var count = 0
    
    init(size : Int) {
        self.size = size // for correct bounds
        
        //        for var i = 0; i < size; i++ {
        for i in 0..<size { // can also be written this way
            var bucket = HashBucket()
            self.hashArray.append(bucket)
        }
    }
    
    func hash(key : String) -> Int {
        
        var total = 0
        
        for character in key.unicodeScalars {
            
            var asc = Int(character.value)
            total += asc // adds value of each char
        }
        
        println(total % self.size)
        return total % self.size // always gives a value within array size
    }
    
    func setObject(objectToStore : AnyObject, key : String) {
        
        var bucket = HashBucket()
        var index = self.hash(key)
        
        bucket.value = objectToStore
        bucket.key = key
        
        self.removeObjectForKey(key) // remove old bucket
        
        bucket.next = self.hashArray[index]
        self.hashArray[index] = bucket // back as the head of linked list
        
        self.count++
    }
    
    // if key exists, removes it
    func removeObjectForKey(key : String) {
        
        var index = self.hash(key)
        var previousBucket : HashBucket?
        var bucket : HashBucket? = self.hashArray[index]
        
        while (bucket != nil) {
            
            if bucket!.key == key {
                
                if previousBucket == nil {
                    //we found the key we are looking for
                    //make sure we don't lose the linked list
                    var nextBucket = bucket?.next
                    self.hashArray[index] ?? bucket?.next!
                    
                } else {
                    previousBucket!.next = bucket?.next
                }
                self.count--
                return
            }
            previousBucket = bucket
            
            if let nextBucket = bucket?.next {
                bucket = nextBucket
            } else {
                bucket = nil
            }
        }
    }
    
    func objectForKey(key : String) -> AnyObject? {
        
        var index = self.hash(key)
        
        var bucket : HashBucket? = self.hashArray[index]
        
        while (bucket != nil) {
            
            if bucket!.key == key {
                // we found our object for the key they were looking for
                return bucket!.value
            } else {
                bucket = bucket!.next!
            }
        }
        
        return nil // we didn't find the bucket with the right key, returning nil
    }
}
