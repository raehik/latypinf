module LaTypInf.Derivation.AST where

import Data.Text (Text)

data TypeError
    = TypeErrorUndefinedVariableUsed Text
    | TypeErrorAny
    deriving (Show)

data Rule = Rule {
    ruleName :: Maybe Text,
    rulePremises :: Either TypeError [Rule],
    ruleJudgement :: Sequent
} deriving (Show)

data Sequent = Sequent {
    sequentContext :: [ContextPart],
    sequentExpr :: Expr,
    sequentType :: Type
} deriving (Show)

data ContextPart
    = Gamma (Maybe Int)
    | Binding Text Type
    deriving (Show)

data Expr
    = EVar Text
    | ENum Int
    | EFunc Text [Expr]
    | ELet Expr Text Expr
    | Epsilon (Maybe Int)
    deriving (Show)

data Type
    = TNum
    | TStr
    | TBool
    | TArrow Type Type
    | Tau (Maybe Int)
    deriving (Show)