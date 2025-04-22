# Makefile pour sys-day04

# ============================
# Variables – adapte-les à ton projet
# ============================
CC      := gcc
CFLAGS  := -Wall -Wextra -Iinclude
SRCS    := $(wildcard src/*.c)
OBJS    := $(SRCS:.c=.o)
NAME    := my_program

# ============================
# Cibles phony
# ============================
.PHONY: all tests_run clean fclean re

# ============================
# all (par défaut)
# ============================
all: $(NAME)

$(NAME): $(OBJS)
	@echo "=== Compilation de $(NAME) ==="
	$(CC) $(CFLAGS) -o $@ $^

# ============================
# tests_run
# ============================
tests_run:
	@echo "=== Lancement des tests ==="
	# Par exemple, si tu utilises un exécutable de tests :
	@if [ -x "./tests/run_tests.sh" ]; then ./tests/run_tests.sh; else echo "Aucun test à exécuter"; fi

# ============================
# clean / fclean
# ============================
clean:
	@echo "=== Suppression des .o ==="
	@rm -f $(OBJS)

fclean: clean
	@echo "=== Suppression de l'exécutable ==="
	@rm -f $(NAME)

# ============================
# re : rebuild complet
# ============================
re: fclean all
	@echo "=== rebuild terminé ==="
