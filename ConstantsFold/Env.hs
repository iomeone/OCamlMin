module ConstantsFold.Env where
  import KNormal.KSyntax

  import Types

  import Control.Exception.Base

  type Env = [(String, KExpr)]

  emptyEnv :: Env
  emptyEnv = []

  extend :: Env -> String -> KExpr -> Env
  extend env s e = (s,e):env

  memi :: String -> Env -> Bool
  memi x env = case x `lookup` env of
    Just (KEint _ _) -> True
    _                -> False

  findi :: String -> Env -> Integer
  findi x env = case x `lookup` env of
    Just (KEint n _) -> n
    _                -> assert False $ findi x env

  -- Just for the purpose of simplifying let expressions
  memp :: String -> Env -> Bool
  memp x env = case x `lookup` env of
    Just (KEpair{}) -> True
    _               -> False

  findp :: String -> Env -> ((String, Type), (String, Type))
  findp x env = case x `lookup` env of
    Just (KEpair e1 e2 _) -> (e1, e2)
    _                     -> assert False $ findp x env

  -- Just for the purpose of simplifying let expressions
  -- That's why we're only interested in x::xs here
  meml :: String -> Env -> Bool
  meml x env = case x `lookup` env of
    Just (KEcons{}) -> True
    _               -> False

  findl :: String -> Env -> ((String, Type), (String, Type))
  findl x env = case x `lookup` env of
    Just (KEcons e1 e2 _) -> (e1, e2)
    _                     -> assert False $ findl x env
