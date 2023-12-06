from ete3 import PhyloTree, Tree, TreeStyle
from tree_format_dict import ids_species_dict

t = PhyloTree("")

t.resolve_polytomy(recursive=True)


def get_species_name(node_name_string, ids_species_dict):	
	node_name_split = node_name_string.split("_")
	if node_name_split[0] == "tr" or node_name_split[0] == "sp":
		node_id = node_name_split[3]
	else:
		node_id = node_name_split[0] + "_" + node_name_split[1]
	species_name = ids_species_dict[node_id]
	return species_name


for leaf in t.iter_leaves():
	old_name = leaf.name
	new_name = get_species_name(old_name, ids_species_dict)
	leaf.name = new_name


t.write(format=2, outfile= "")
