using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/*
 * Created on Sun Jul 30 2019
 *
 * Copyright (c) 2019 Glowbom.
 */
public class QuestCreator : MonoBehaviour
{
    private const int MAIN_ELEMENTS_COUNT = 4;

    public Text projectName;
    // All
    public Button allPreviousButton;
    public Button allNextButton;
    public Button[] allTitleButtons;
    public Button[] allInsertButtons;
    public Button[] allRemoveButtons;
    public GameObject allValues;
    public InputField allValuesName;
    public InputField allValuesValue;

    // Item
    public InputField title;
    public InputField description;
    public GameObject values;
    public InputField valuesName;
    public InputField valuesValue;
    // Go To Buttons
    public Text[] buttonTexts;
    public InputField[] buttonTitles;
    public InputField[] buttonValues;
    public Button[] buttonGoButtons;
    public Button[] buttonInsertButtons;
    public Button[] buttonRemoveButtons;

    QuestLoader questLoader = new QuestLoader();

    int mainItemsPosition = 0;
    
    // Start is called before the first frame update
    void Start()
    {
        questLoader.load();

        initMainQuest();
    }

    private void initMainQuest()
    {
        if (questLoader.logic != null)
        {
            for (int i = 0 + mainItemsPosition; i < mainItemsPosition + MAIN_ELEMENTS_COUNT; i++)
            {
                bool hasItem = i - mainItemsPosition < allTitleButtons.Length;

                allTitleButtons[i - mainItemsPosition].gameObject.SetActive(hasItem);
                allInsertButtons[i - mainItemsPosition].gameObject.SetActive(hasItem);
                allRemoveButtons[i - mainItemsPosition].gameObject.SetActive(hasItem);

                if (hasItem)
                {
                    allTitleButtons[i - mainItemsPosition].GetComponentInChildren<Text>().text = i == questLoader.logic.currentItemIndex ?
                    "* " + i + " : " + questLoader.logic.items[i].title :
                     i + " : " + questLoader.logic.items[i].title;
                }
            }

            allPreviousButton.gameObject.SetActive(mainItemsPosition != 0);
            allNextButton.gameObject.SetActive(mainItemsPosition != questLoader.logic.items.Length - MAIN_ELEMENTS_COUNT);
            initCurrentItem();
        }
    }

    private void initCurrentItem()
    {
        title.text = questLoader.logic.items[questLoader.logic.currentItemIndex].title;
        description.text = questLoader.logic.items[questLoader.logic.currentItemIndex].description;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void save() {
        questLoader.save();
    }

    public void load() {
        questLoader.load();
    }

    public void allNextPressed() {
        if (mainItemsPosition < questLoader.logic.items.Length - MAIN_ELEMENTS_COUNT)
        {
            ++mainItemsPosition;
            initMainQuest();
        }
    }

    public void allPreviousPressed() {
        if (mainItemsPosition > 0)
        {
            --mainItemsPosition;
            initMainQuest();
        }
    }

    public void allValuesNextPressed() {

    }

    public void allValuesPreviousPressed() {

    }

    public void valuesNextPressed() {

    }

    public void valuesPreviousPressed() {

    }

    public void buttonsNextPressed() {

    }

    public void buttonsPreviousPressed() {

    }

    // All

    public void allTitlePressed(int i)
    {
        updateQuest();

        questLoader.logic.currentItemIndex = mainItemsPosition + i;
        initMainQuest();
    }

    private void updateQuest()
    {
        questLoader.logic.items[questLoader.logic.currentItemIndex].title = title.text;
        questLoader.logic.items[questLoader.logic.currentItemIndex].description = description.text;
    }

    public void allInsertPressed(int i) {
        
    }

    public void allRemovePressed(int i) {
        
    }

    public void allValueInsertPressed() {
        
    }

    public void allValueRemovePressed() {
        
    }

    // Buttons

    public void buttonInsertPressed(int i) {
        
    }

    public void buttonGoPressed(int i) {
        
    }

    public void buttonRemovePressed(int i) {
        
    }

    public void valueInsertPressed() {
        
    }

    public void valueRemovePressed() {
        
    }

    public void backPressed() {
        gameObject.SetActive(false);
    }
}
