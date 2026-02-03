NAME        = libasm.a

SRC         = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
SRC_BONUS   =  ft_atoi_base.s _ft_list_push_front.s ft_list_size.s ft_list_sort.s ft_list_remove_if.s

OBJ         = $(SRC:.s=.o)
OBJ_BONUS   = $(SRC_BONUS:.s=.o)

NASM        = nasm
FLAGS       = -f elf64

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

bonus: $(OBJ) $(OBJ_BONUS)
	ar rcs $(NAME) $(OBJ) $(OBJ_BONUS)

%.o: %.s
	$(NASM) $(FLAGS) $< -o $@

clean:
	rm -f $(OBJ) $(OBJ_BONUS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re bonus