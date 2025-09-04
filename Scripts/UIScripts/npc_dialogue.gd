class_name DialogueBox extends Control

#Config FIles for each conversation will load upon beginning conversation
#Sections will represent a branch of conversation, with keys serving as pointers to lines within that branch
#Within the line of dialogue, there will be a hexcode at the end, marked with an @
#Hexcode will be removed from display, and interpreted as pointers for the response options
#Arguments within the hexcode will be demarcated with a symbol, probably |
#The NPC will need to have persistent flags for dialogue (e.g. Introduced, friendly, annoyed, major interactions)
#Perhaps this should be saved to a config file for NPC flags. Only major NPCs will need this. 
#Section for NPC Reference, a key for each flag.
