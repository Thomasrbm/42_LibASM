NAME            = libasm.a

SRC_DIR         = srcs
OBJ_DIR         = objs

SOURCES         = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
BONUS_SOURCES   = ft_atoi_base.s ft_list_push_front.s ft_list_size.s ft_list_sort.s ft_list_remove_if.s ft_remove_data.s ft_lst_new.s

SRCS            = $(addprefix $(SRC_DIR)/, $(SOURCES))
OBJS            = $(addprefix $(OBJ_DIR)/, $(SOURCES:.s=.o))

BONUS_SRCS      = $(addprefix $(SRC_DIR)/, $(BONUS_SOURCES))
BONUS_OBJS      = $(addprefix $(OBJ_DIR)/, $(BONUS_SOURCES:.s=.o))

NASM            = nasm
NASM_FLAGS      = -f elf64
RM              = rm -rf

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

bonus: $(OBJS) $(BONUS_OBJS)
	ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASM_FLAGS) $< -o $@

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re bonus