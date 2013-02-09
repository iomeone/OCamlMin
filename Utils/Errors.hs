module Utils.Errors (
  unboundVariable,
  overlappingIds,
  cannotUnify
) where

  unboundVariable :: String -> String
  unboundVariable v = "Unbound variable " ++ v

  overlappingIds :: Show a => a -> String
  overlappingIds p = "Overlapping identifires in: " ++ show p

  cannotUnify :: Show a => a -> a -> String
  cannotUnify t1 t2 = "Cannot unify " ++ show t1 ++ " with " ++ show t2
