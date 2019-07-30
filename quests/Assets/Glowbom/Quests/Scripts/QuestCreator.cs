using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class QuestCreator : MonoBehaviour
{
    QuestLoader loader = new QuestLoader();
    
    // Start is called before the first frame update
    void Start()
    {
        loader.load();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
