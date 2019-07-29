using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/*
 * Created on Sun Jul 28 2019
 *
 * Copyright (c) 2019 Glowbom.
 */
public class QuestLoader
{
    public Logic logic = null;
    public string name = "Template Quest";

    public void initialize() {
        if (logic == null) {
            load();
        }
    }

    public void load() {
        var textAsset = Resources.Load ("Data/TemplateQuest") as TextAsset;
        logic = JsonUtility.FromJson<Logic> (textAsset.text);
    }

    public void save() {
        
    }
}
