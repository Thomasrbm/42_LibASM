# Configuration
NASM = nasm
CC = gcc
NASM_FLAGS = -f elf64 -g
OBJ_DIR = objects

# Règle magique pour n'importe quelle fonction (ex: make strlen)
%:
	@mkdir -p $(OBJ_DIR)
	
	@# Assemblage des fichiers source .s
	$(NASM) $(NASM_FLAGS) ft_$*.s -o $(OBJ_DIR)/ft_$*.o
	$(NASM) $(NASM_FLAGS) main_$*.s -o $(OBJ_DIR)/main_$*.o
	
	@# Linkage avec gcc (pour la libc) et désactivation du PIE pour faciliter GDB
	$(CC) -no-pie $(OBJ_DIR)/main_$*.o $(OBJ_DIR)/ft_$*.o -o test_$*
	
	@echo "✨ Compilation finie pour $*"
	@echo "📁 Objets stockés dans : $(OBJ_DIR)/"
	@echo "🚀 Exécutable créé : ./test_$*"

all:
	@echo "Utilisation : make <nom_fonction> (ex: make strlen)"

# Supprime uniquement les fichiers objets et le dossier
clean:
	rm -rf $(OBJ_DIR)
	@echo "🧹 Dossier $(OBJ_DIR) supprimé."

# Supprime les objets ET tous les exécutables de test
fclean: clean
	rm -f test_*
	@echo "🗑️  Tous les exécutables 'test_*' ont été supprimés."

# Recommence tout à zéro
re: fclean
	@echo "🔄 Remise à zéro effectuée."

.PHONY: clean fclean re