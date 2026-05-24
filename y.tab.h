#ifndef _yy_defines_h_
#define _yy_defines_h_

#define HELLO 257
#define EXITCMD 258
#define PRINT 259
#define NUMBER 260
#define ID 261
#define INC 262
#define DEC 263
#define IF 264
#define GT 265
#define LT 266
#define GE 267
#define LE 268
#define EQ 269
#define NE 270
#define UMINUS 271
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE {
    float fval;
    char *sval;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */
