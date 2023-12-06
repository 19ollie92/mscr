from os import listdir
from ete3 import PhyloTree, TreeStyle


def listdir_nohidden(path):
    for f in listdir(path):
        if not f.startswith('.'):
            yield f
	

def create_pdfs (in_treedir, out_treedir):
    for tree_file in listdir_nohidden(in_treedir):
        tree_path = in_treedir + tree_file
        tree = PhyloTree(tree_path)
        new_tree_path = out_treedir + tree_file
        ts = TreeStyle()
        ts.show_leaf_name = False
        ts.show_branch_support = True
        ts.branch_vertical_margin = 10
        ts.scale = 500
        tree.render(new_tree_path + ".pdf", tree_style=ts)
    return 0


in_treedir=""
out_treedir=""


create_pdfs(in_treedir, out_treedir)







