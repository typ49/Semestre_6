// expr_tree.h
#ifndef EXPR_TREE_H
#define EXPR_TREE_H

#include <stdio.h>
#include <stdlib.h>

typedef struct ExprNode {
  char op;                // Opérateur: '+', '-', '*', '/', ou 0 pour un nœud feuille
  double value;           // Utilisé si op est 0
  const char *name;       // Nom de la constante, si applicable
  struct ExprNode *left;  // Sous-arbre gauche
  struct ExprNode *right; // Sous-arbre droit
} ExprNode;

ExprNode* createNode(char op, ExprNode* left, ExprNode* right) {
  ExprNode* node = (ExprNode*)malloc(sizeof(ExprNode));
  node->op = op;
  node->left = left;
  node->right = right;
  return node;
}

ExprNode* createLeaf(double value, const char* name) {
  ExprNode* node = (ExprNode*)malloc(sizeof(ExprNode));
  node->op = 0;
  node->value = value;
  node->name = name;
  node->left = NULL;
  node->right = NULL;
  return node;
}

void printTree(ExprNode* node, int level) {
  if (node == NULL) return;
  printTree(node->right, level + 1);
  if (node->op) {
    printf("%*s%c\n", level*4, "", node->op);
  } else if (node->name) {
    printf("%*s%s\n", level*4, "", node->name);
  } else {
    printf("%*s%.2f\n", level*4, "", node->value);
  }
  printTree(node->left, level + 1);
}

#endif /* EXPR_TREE_H */
