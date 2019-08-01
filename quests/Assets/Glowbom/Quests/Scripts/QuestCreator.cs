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
    public GridStatusScript game;
    private const int MAIN_ELEMENTS_COUNT = 4;
    private const int ITEM_BUTTONS_COUNT = 3;

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
    public Button gotoPreviousButton;
    public Button gotoNextButton;
    public Text[] buttonTexts;
    public InputField[] buttonTitles;
    public InputField[] buttonValues;
    public Button[] buttonGoButtons;
    public Button[] buttonInsertButtons;
    public Button[] buttonRemoveButtons;
    public GameObject[] buttonContainers;

    QuestLoader questLoader = new QuestLoader();

    int mainItemsPosition = 0;
    int itemButtonsPosition = 0;

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
        Logic.Item item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        title.text = item.title;
        description.text = item.description;

        int buttonsCount = currentItemButtonsCount();

        for (int i = 0 + itemButtonsPosition; i < itemButtonsPosition + ITEM_BUTTONS_COUNT; i++)
        {
            bool hasItem = i - itemButtonsPosition < buttonsCount;

            buttonContainers[i - itemButtonsPosition].gameObject.SetActive(hasItem);

            if (hasItem)
            {
                buttonTexts[i - itemButtonsPosition].text = "Button " + (i + 1);
                buttonTitles[i - itemButtonsPosition].text = item.buttonsTexts[i];
                buttonValues[i - itemButtonsPosition].text = item.goIndexes[i].ToString();
            }
        }

        gotoPreviousButton.gameObject.SetActive(itemButtonsPosition != 0);
        gotoNextButton.gameObject.SetActive(itemButtonsPosition < buttonsCount - ITEM_BUTTONS_COUNT);
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
        initMainQuest();
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

    private int currentItemButtonsCount()
    {
        Logic.Item item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        int buttonsCount = 0;
        foreach (var goIndex in item.goIndexes)
        {
            if (goIndex == -1)
            {
                break;
            }
            ++buttonsCount;
        }
        return buttonsCount;
    }

    public void buttonsNextPressed() {
        Logic.Item item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        int buttonsCount = currentItemButtonsCount();

        if (itemButtonsPosition <= buttonsCount - MAIN_ELEMENTS_COUNT)
        {
            updateQuest();
            ++itemButtonsPosition;
            initCurrentItem();
        }
    }

    public void buttonsPreviousPressed() {
        if (itemButtonsPosition > 0)
        {
            updateQuest();
            --itemButtonsPosition;
            initCurrentItem();
        }
    }

    // All

    public void allTitlePressed(int i)
    {
        updateQuest();

        questLoader.logic.currentItemIndex = mainItemsPosition + i;
        itemButtonsPosition = 0;
        initMainQuest();
    }

    private void updateQuest()
    {
        Logic.Item item = questLoader.logic.items[questLoader.logic.currentItemIndex];
        item.title = title.text;
        item.description = description.text;

        int buttonsCount = currentItemButtonsCount();
        for (int i = 0 + itemButtonsPosition; i < itemButtonsPosition + ITEM_BUTTONS_COUNT; i++)
        {
            bool hasItem = i - itemButtonsPosition < buttonsCount;

            if (hasItem)
            {
                item.buttonsTexts[i] = buttonTitles[i - itemButtonsPosition].text;
                try
                {
                    item.goIndexes[i] = int.Parse(buttonValues[i - itemButtonsPosition].text);
                    if (item.goIndexes[i] >= questLoader.logic.items.Length)
                    {
                        item.goIndexes[i] = 0;
                    }
                } catch(Exception e)
                {
                    item.goIndexes[i] = 0;
                }

            }
        }
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
        updateQuest();
        save();
        game.logic = questLoader.logic;
        game.procced();
        gameObject.SetActive(false);
    }
}
