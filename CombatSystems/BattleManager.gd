extends Node

class_name battle_manager

#region GLOBAL VARIABLES
@export var party: Array[battle_demon]
@export var enemies: Array[battle_demon]
@export var drawing: DrawUnits
@export var BUI: battle_ui
@export var nodes: Array[action_node]
#endregion

func _init(input_party:Array[battle_demon], input_enemies:Array[battle_demon]):
	#set parameters
	party = input_party
	enemies = input_enemies
	
	#create UI
	drawing = DrawUnits.new(party, enemies, "SIM")
	BUI = battle_ui.new(party, enemies)
	add_child(drawing)
	add_child(BUI)
	
	#create nodes for each demon on the field
	for i in range(min(4,len(party))):
		var new_node = action_node.new(party[i])
		#set connection for previous node
		if i != 0:
			nodes[i-1].next_node = new_node
		nodes.append(new_node)
	
	for i in range(len(enemies)):
		var new_node = action_node.new(enemies[i])
		#set connection for previous node
		nodes[i+min(4,len(party))-1].next_node = new_node
		nodes.append(new_node)
	print(GetTail(nodes[0]).unit.disp_name)
	

##this function gets the tail of the linked list
func GetTail(cur:action_node):
	while cur and cur.next_node:
		cur = cur.next_node
	return cur

##this function swaps the data of 2 nodes
func Swap(node1:action_node, node2:action_node):
	var temp = {"unit": node1.unit,
				"Spe": node1.adjusted_Spe,
				"priority": node1.priority}
	node1.adjusted_Spe = node2.adjusted_Spe
	node1.priority = node2.priority
	node1.unit = node2.unit
	node2.adjusted_Spe = temp.Spe
	node2.priority = temp.priority
	node2.unit = temp.unit

##this function partitions the list, taking the first element as the pivot
func Partition(head:action_node, tail:action_node):
	var pivot = head
	
	#pre (previous) and curr (current) are used to shift
	#nodes with slower speeds to the left of the pivot
	var pre = head
	var curr = head
	
	#traverse the list until you reach the node after the tail
	while curr != tail.next_node:
		if ((curr.adjusted_Spe < pivot.adjusted_Spe) and (curr.priority <= pivot.priority)) or curr.priority < pivot.priority:
			#swap data between curr and pre.next
			Swap(curr, pre.next_node)
			
			pre = pre.next_node
		elif (curr.adjusted_Spe == pivot.adjusted_Spe) and (curr.priority == pivot.priority):
			#if they 
			var rng = RandomNumberGenerator.new()
			var rand_num = rng.randi_range(0,101)
		curr = curr.next_node
	
	#swap data between pivot and pre
	Swap(pivot, pre)
	
	#return pre as the new pivot
	return pre

##helper function for the quicksort
func QuickSortHelper(head:action_node, tail:action_node):
	#just return null if there are 1 or 0 nodes
	if head == null or head == tail:
		return null
	
	#call partition to find the pivot
	var pivot = Partition(head, tail)
	
	#recursive call for left part
	QuickSortHelper(head, pivot)
	
	#recursive call for right part
	QuickSortHelper(pivot.next_node, tail)

##This is the main quicksorting function
##(basically a wrapper for QuickSortHelper)
func QuickSort(head:action_node):
	var tail = GetTail(head)
	QuickSortHelper(head, tail)
	return head

##this function establishes turn order
func SetTurnOrder(effected_units:Array[battle_demon]):
	print("filler")
