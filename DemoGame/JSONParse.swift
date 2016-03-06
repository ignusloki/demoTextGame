//
//  JSONParse.swift
//  DemoGame
//
//  Created by Felipe on 1/02/2016.
//  Copyright © 2016 fastman. All rights reserved.
//

import Foundation

var fileName: String = "script"
var scene = [[String:AnyObject]]()


func loadJsonScene() -> [String] {
    
    var heroSpeech = [String]()
    var villanSpeech = [String]()
    
    if let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") {
        
        do {
            
            let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            do {
                
                let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
                
                if let scene = jsonResult["1"] as? [[String: AnyObject]] {
                    for speech in scene {
                        
                        if let villan = speech["villan"] as? [[String: AnyObject]] {                            
                            for phrases in villan {
                                if let phrase = phrases["phrase"] as? String {
                                    print(phrase)
                                    print("=====================================================")
                                    villanSpeech.append(phrase)
                                }
                            }
                        }
                        
                        if let player = speech["player"] as? [[String: AnyObject]] {
                            
                            for choices in player {
                                if let choice = choices["escolha"] as? String {
                                    print(choice)
                                    print("=====================================================")
                                    heroSpeech.append(choice)
                                }
                            }
                            
                            for linkResp in player {
                                if let idResp = linkResp["resposta"] as? String {
                                    print(idResp)
                                    print("=====================================================")
                                    heroSpeech.append(idResp)
                                }
                            }
                        }
                    }
                }
                
            } catch { print("Erro1")}
        } catch { print("Erro2")}
    }
    
    return villanSpeech
}

func callScene() {
    
    
}