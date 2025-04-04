#!/usr/bin/env python
# coding: utf-8

# Author Engin Tekin github.com/tekinengin
'''
This script typed for CSE210A-Programming Languages - Semantic Applications - Structural Operational Semantics (Small Step)

@Following tutorial has been used during preparation of this code. --- #### https://ruslanspivak.com/lsbasi-part7/ ####

There are four main classes AST, LEXER, PARSER, INTERPRETER

AST: Base Class in order to store Abstract-Syntax Tree

LEXER: This class is created to pass through input and tokenize components.

PARSER: Parser is using tokenized input in order to create Abstract-Syntax Tree (AST)

INTERPRETER: This class accepts an AST and evaluates with small steps return next sequence of command and state it.

Examples:

x := 10

x := 10 < 0 ? 1 : 0

if true then { x := 10 ; y := ( 20 * 10 - -3 } else skip

while ¬ ( y - -3 = y * z ∨ n * y < 1 * 2 ) do skip 

'''


INT, BOOLEAN, SUM, SUB, MUL, AND, OR, NOT, EQ, LESS, LPARENT, RPARENT, ASSIGN, ID, SEMCOL, SKIP, LSCOPE, RSCOPE, IF, THEN, ELSE, WHILE, DO, TERNARY, COLON, EOF = \
        ['INTEGER', 'BOOLEAN', 'SUM', 'SUB', 'MUL', 'AND', 'OR', 'NOT', 'EQ', 'LESS', '(', ')', ':=', 'ID', ';', 'SKIP', '{', '}', 'IF', 'THEN', 'ELSE', 'WHILE', 'DO', '?', ':','EOF']

class Token(object):
    def __init__(self, type, value):
        self.type = type
        self.value = value
        
# Base Class for AST Data Structure
class AST:
    pass

# Operator Node Class for AST
class Operator_Node(AST):
    def __init__(self, left, operation, right):
        self.left = left
        self.operation = operation
        self.right = right
    
# Uni-Operator Node Class for AST
class Uni_Operator_Node(AST):
    def __init__(self, operation, expr):
        self.operation = operation
        self.expr = expr

# Operand Node Class for AST
class Operand_Node(AST):
    def __init__(self, token):
        self.type = token.type
        self.value = token.value

# Assign Node Class for AST
class Assign_Node(AST):
    def __init__(self, var, operation, expr):
        self.var = var
        self.operation = operation
        self.expr = expr

# Variable Node Class for AST
class Var_Node(AST):
    def __init__(self, token):
        self.token = token
        self.id = token.value

class Pass_Node(AST):
    pass

class Scope_Node(AST):
    def __init__(self):
        self.statement_list = []

class If_Node(AST):
    def __init__(self, condition, then_scope, else_scope, tenary = False):
        self.condition = condition
        self.then_scope = then_scope
        self.else_scope = else_scope
        self.tenary = tenary

class While_Node(AST):
    def __init__(self,condition, scope):
        self.condition = condition
        self.scope = scope
       
# Lexer Class in order to tokenize input 
class Lexer(object):
    def __init__(self, text):
        self.text = text
        self.current_pos = 0
        self.current_char = text[self.current_pos]
       
    # Mode Cursor until EOF 
    def advance(self):
        self.current_pos += 1
        
        if self.current_pos == len(self.text):
            self.current_char = None
        else:
            self.current_char = self.text[self.current_pos]

    def check_next(self):
        pos = self.current_pos + 1
        
        if pos == len(self.text):
            return None
        else:
            return self.text[pos]

            
    # Read whole number
    def get_int(self):
        result = ''
        while self.current_char is not None and self.current_char.isdigit():
            result += self.current_char
            self.advance()
        return int(result)

    # Read word
    def get_word(self):
        result = ''
        while self.current_char is not None and self.current_char.isalnum():
            result += self.current_char
            self.advance()
        return result

        
    # Reads next token
    def get_next_token(self):
        while self.current_char is not None:
            if self.current_char.isspace():
                self.advance()
                continue
                
            # '-' can be before a negative number or can be a operator 
            elif self.current_char == '-':
                self.advance()
                #if self.current_char.isspace():
                return Token(SUB, '-')
                #else:
                #    return Token(INT, -1 * self.get_int())
                
            elif self.current_char.isdigit():
                return Token(INT, self.get_int())
            
            elif self.current_char == '+':
                self.advance()
                return Token(SUM, '+')
            
            elif self.current_char == '*':
                self.advance()
                return Token(MUL, '*')

            elif self.current_char == '(':
                self.advance()
                return Token(LPARENT, '(')

            elif self.current_char == ')':
                self.advance()
                return Token(RPARENT, ')')

            elif self.current_char == '∧':
                self.advance()
                return Token(AND, 'and')

            elif self.current_char == '∨':
                self.advance()
                return Token(OR, 'or')

            elif self.current_char.isalpha():
                word = self.get_word()
                if word == 'true':
                    return Token(BOOLEAN, True)
                elif word == 'false':
                    return Token(BOOLEAN, False)
                elif word == 'skip':
                    return Token(SKIP, 'pass') # ????
                elif word == 'if':
                    return Token(IF, 'IF')
                elif word == 'then':
                    return Token(THEN, 'THEN')
                elif word == 'else':
                    return Token(ELSE, 'ELSE')
                elif word == 'while':
                    return Token(WHILE, 'WHILE')
                elif word == 'do':
                    return Token(DO, 'do')
                else:
                    return Token(ID, word)

            elif self.current_char == '{':
                self.advance()
                return Token(LSCOPE, '{')

            elif self.current_char == '}':
                self.advance()
                return Token(RSCOPE, '}')


            elif self.current_char == '¬':
                self.advance()
                return Token(NOT,'¬')

            elif self.current_char == '=':
                self.advance()
                return Token(EQ,'=')

            elif self.current_char == '<':
                self.advance()
                return Token(LESS,'<')

            elif self.current_char == ':' and self.check_next() == '=':
                self.advance()
                self.advance()
                return Token(ASSIGN, ':=')

            elif self.current_char == ';':
                self.advance()
                return Token(SEMCOL, ';')
            
            elif self.current_char == '?':
                self.advance()
                return Token(TERNARY, '?')
            
            elif self.current_char == ':':
                self.advance()
                return Token(COLON, ':')

            
            raise Exception('Syntax Error...')
            
        return Token(EOF, None)
    
class Parser(object):
    def __init__(self,lexer):
        self.lexer = lexer
        self.current_token = self.lexer.get_next_token()

        
    def _get_next_token(self):
        self.current_token = self.lexer.get_next_token()

    def if_statement(self):
        condition = self.bool_expression()
        #print(self.current_token.type)
        self._get_next_token() ## skip 'then' token
        then_scope = self.statement()
        self._get_next_token() ## skip 'else' token
        else_scope = self.statement()
        return If_Node(condition, then_scope, else_scope)

    def while_statement(self):
        condition = self.bool_expression()
        self._get_next_token() ## Skip 'do' token
        scope = self.statement()
        return While_Node(condition, scope)
        
    def scope_statement(self):
        nodes = self.statement_list() 
        root = Scope_Node()
        for node in nodes:
            root.statement_list.append(node)
        return root
        
    def statement_list(self):
        node = self.statement()
        scope = [node]
        while self.current_token.type == SEMCOL:
            self._get_next_token()
            scope.append(self.statement())

        return scope
        
    def statement(self):
        #print(self.current_token.type)
        if self.current_token.type == ID:
            node = self.assignment_statement()
        elif self.current_token.type == SKIP:
            self._get_next_token()
            node = Pass_Node()
        elif self.current_token.type == IF:
            self._get_next_token()
            node = self.if_statement()
        elif self.current_token.type == WHILE:
            self._get_next_token()
            node = self.while_statement()
        elif self.current_token.type == LSCOPE:
            #print(self.current_token.type)
            self._get_next_token()
            #print(self.current_token.type)
            node = self.scope_statement()
            self._get_next_token() ## skip RSCOPE
        return node

    def assignment_statement(self):
        left = self.variable()
        token = self.current_token
        self._get_next_token()
        right = self.bool_expression()
        node = Assign_Node(left, token, right)
        return node

    def variable(self):
        node = Var_Node(self.current_token)
        self._get_next_token()
        return node
        
    def factor(self): 
        #print(self.current_token.type)

        if self.current_token.type == SUM:
            token = self.current_token
            self._get_next_token()
            return Uni_Operator_Node(operation=token, expr=self.factor())
            
        elif self.current_token.type == SUB:
            token = self.current_token
            self._get_next_token()
            return Uni_Operator_Node(operation=token, expr=self.factor())

        elif self.current_token.type in [INT, BOOLEAN]:
            token = self.current_token
            self._get_next_token()
            return Operand_Node(token)

        elif self.current_token.type == NOT:
            token = self.current_token
            self._get_next_token()
            node = Uni_Operator_Node(operation=token, expr= self.factor())
            return node

        elif self.current_token.type == LPARENT:
            self._get_next_token()
            node = self.bool_expression()
            self._get_next_token()
            return node

        else:
            node = self.variable()
            return node

        
    def term(self):
        #print(self.current_token.type)
        node = self.factor()     
        while self.current_token.type is MUL:
            token = self.current_token
            self._get_next_token()
            node = Operator_Node(left=node, operation=token, right=self.factor())
        return node
    
    def bool_expression(self):
        #print(self.current_token.type)
        node = self.bool_first_pri_expr()
        while self.current_token.type in [AND, OR]:
            token = self.current_token
            self._get_next_token()
            node = Operator_Node(left=node, operation=token, right=self.bool_first_pri_expr())
            
        if self.current_token.type == TERNARY:
            self._get_next_token() ## skip '?'
            then_expression = self.bool_expression()
            self._get_next_token() ## skip ':'
            else_expression = self.bool_expression()
            return If_Node(node, then_expression, else_expression, tenary = True)
        return node 
    
    def bool_first_pri_expr(self):
        #print(self.current_token.type)
        node = self.arith_expression()
        while self.current_token.type in [EQ, LESS]:
            token = self.current_token
            self._get_next_token()
            node = Operator_Node(left=node, operation=token, right=self.arith_expression())
        return node
    
    def arith_expression(self):
        #print(self.current_token.type)
        node = self.term()
        while self.current_token.type in [SUM, SUB]:
            token = self.current_token
            self._get_next_token()
            node = Operator_Node(left=node, operation=token, right=self.term())  
        return node 
    
    def parse(self):
        return self.scope_statement()
    
class Interpreter(object):
    def __init__(self, GLOBAL_SCOPE={}):
        self.GLOBAL_SCOPE = GLOBAL_SCOPE
        #self.command_stack = []
        self.command = ''

        
    def visit(self, node, vis):
        #print(type(node))
        if type(node) == Scope_Node:
            return self.visit_Scope(node,vis)
        
        elif type(node) == Assign_Node:
            return self.visit_Assign(node,vis)
        
        elif type(node) == Var_Node:
            return self.visit_Var(node,vis)
        
        elif type(node) == Pass_Node:
            return self.visit_Pass(node,vis)
        
        elif type(node) == Operand_Node:
            return self.visit_operand(node,vis)
            
        elif type(node) == Operator_Node:
            return self.visit_operator(node,vis)
        
        elif type(node) == Uni_Operator_Node:
            return self.visit_uni_operator(node,vis)

        elif type(node) == If_Node:
            return self.visit_If(node,vis)
        
        elif type(node) == While_Node:
            return self.visit_While(node,vis)
        
    def visit_operand(self, node, vis):
        if not vis:
            return node.value
        else:
            return str(node.value).lower()

    def visit_uni_operator(self, node, vis):
        if node.operation.type == SUB:
            if not vis:
                return -1 * self.visit(node.expr, vis)
            else:
                return '-'+ self.visit(node.expr, vis)

        elif node.operation.type == NOT:
            if vis:
                return '¬' + self.visit(node.expr, vis)
            return not (self.visit(node.expr, vis))
        
    def visit_operator(self, node, vis):
        if node.operation.type == SUM:
            if vis:
                return '(' + self.visit(node.left, vis) + '+'+ self.visit(node.right, vis) + ')'
            return self.visit(node.left, vis) + self.visit(node.right, vis)
        
        elif node.operation.type == SUB:
            if vis:
                return '(' + self.visit(node.left, vis) + '-'+ self.visit(node.right, vis) + ')'
            return self.visit(node.left, vis) - self.visit(node.right, vis)
        
        elif node.operation.type == MUL:
            if vis:
                return '(' + self.visit(node.left, vis) + '*'+ self.visit(node.right, vis) + ')'
            return self.visit(node.left, vis) * self.visit(node.right, vis)

        elif node.operation.type == AND:
            if vis:
                return '(' + self.visit(node.left, vis) + '∧'+ self.visit(node.right, vis) + ')'
            return self.visit(node.left, vis) and self.visit(node.right, vis)

        elif node.operation.type == OR:
            if vis:
                return '(' + self.visit(node.left, vis) + '∨'+ self.visit(node.right, vis) + ')'
            return self.visit(node.left, vis) or self.visit(node.right, vis)

        elif node.operation.type == EQ:
            if vis:
                return '(' +self.visit(node.left, vis) + '='+ self.visit(node.right, vis)+ ')'
            return self.visit(node.left, vis) == self.visit(node.right, vis)

        elif node.operation.type == LESS:
            if vis:
                return '(' + self.visit(node.left, vis) + '<'+ self.visit(node.right, vis) + ')'
            return self.visit(node.left, vis) < self.visit(node.right, vis)

        elif node.operation.type == NOT:
            if vis:
                return ' ¬' + self.visit(node.expr, vis)
            return not (self.visit(node.expr, vis))
        
    def visit_Assign(self, node, vis):
        var_name = node.var.id
        if not vis:
            self.GLOBAL_SCOPE[var_name] = self.visit(node.expr, vis)
            return 'skip'
        else:
            return  var_name + ' := ' + self.visit(node.expr, vis = True)
        
    def visit_Var(self, node, vis):
        var_name = node.id
        if vis:
            return var_name
        value = self.GLOBAL_SCOPE.get(var_name)
        if value is None:
            return 0 ## Assuming every variable is INTEGER
        return value

    def visit_Pass(self, node, vis):
        if not vis:
            return ''
        else : 
            return 'skip'
    
    def visit_Scope(self, node, vis):
        output = ''
        is_first_command = True
        for index,statement in enumerate(node.statement_list):
            if not vis:
                temp = self.visit(statement, vis = False)
                if temp != '' and temp != 'scope':
                    self.command += temp
                for statement in node.statement_list[index+1:]:
                    if temp == '':
                        self.command += self.visit(statement, vis = True) 
                        temp = '1'
                    else:
                        self.command += '; ' + self.visit(statement, vis = True)
                return 'scope'
            else:
                if is_first_command:
                    output += self.visit(statement, vis = True)
                    is_first_command = False
                else:
                    output += '; ' + self.visit(statement, vis = True)
        return output
                
    def visit_If(self, node, vis):
        if not vis:
            if self.visit(node.condition, vis):
                return self.visit(node.then_scope, vis = not node.tenary)
            else:
                return self.visit(node.else_scope, vis = not node.tenary)
        
        else:
            if not node.tenary: 
                return 'if ' + self.visit(node.condition, vis = True) \
                        + ' then ' + '{ ' + self.visit(node.then_scope, vis = True) + ' }' \
                        + ' else ' + '{ ' + self.visit(node.else_scope, vis = True) + ' }'
            else:
                return self.visit(node.condition, vis = True) + '?' + self.visit(node.then_scope, vis = True) + ':' + self.visit(node.else_scope, vis = True)

    def visit_While(self, node, vis):
        if not vis:    
            if self.visit(node.condition, vis):
                scope  = self.visit(node.scope, vis = True)
                output = scope + '; while ' + self.visit(node.condition, vis = True) + ' do ' + '{ ' + scope + ' }' 
                return output
            else:
                return 'skip'
        else: 
            scope  = self.visit(node.scope, vis = True)
            output = 'while ' + self.visit(node.condition, vis = True) + ' do ' + '{ ' + scope + ' }'
            return output

    def eval(self, root, vis=False):
        self.visit(root, vis)
        return self.command, self.GLOBAL_SCOPE



    def print_table(self, state):
        keys = sorted(list(state.keys()))
        len_keys = len(keys)
        result = '{'
        for index in range(len_keys):
            result += keys[index] + ' → ' + str(state[keys[index]])
            if len_keys - index - 1 > 0:
                result += ', '

        result += '}'
        return result

def main():
    while True:
        try:
            try:
                command = raw_input('')
            except NameError:  # Python3
                command = input('')
        except EOFError:
            break
        if not command:
            continue
        state = {}


        max_Step = 10000
        counter = 0
        while command != 'skip' and counter < max_Step:
            counter += 1
            lexer = Lexer(command)
            parser = Parser(lexer)
            AST = parser.parse()
            interpreter = Interpreter(state)
            command, state = interpreter.eval(AST)
            if command != '':
                print('⇒ ' + command + ', ' + interpreter.print_table(state))

            
    
if __name__ == '__main__':
    main()