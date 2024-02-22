##
## ASM_MINILIBC PROJECT, 2024
## [Conteneur de développement : C @ desktop-linux]
## File description:
## Makefile
##

SRC	=	strlen.asm 				\
		memcpy.asm 				\
		memset.asm 				\
		strchr.asm 				\
		strrchr.asm 			\
		strcmp.asm 				\
		strncmp.asm 			\
		strcasecmp.asm			\
		strstr.asm

CC = ld

NASM = nasm

ASMFLAGS = -f elf64

OBJ	=	$(SRC:.asm=.o)

RM = rm -f

NAME	=	libasm.so

all:	$(NAME)

%.o: %.asm
	$(NASM) $(ASMFLAGS) -o $@ $<

$(NAME): $(OBJ)
	$(CC) -shared -o $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re:	 fclean all

.PHONY = all clean fclean re
