module Inline.Size where
  import KNormal.KSyntax

  size :: KExpr -> Integer
  size (KEifEq _ _ e1 e2 _)  = 1 + size e1 + size e2
  size (KEifLE _ _ e1 e2 _)  = 1 + size e1 + size e2
  size (KElet _ e1 e2 _)     = 1 + size e1 + size e2
  size (KEletRec fd e _)     = 1 + size e + size (body fd)
  size (KEletPair _ _ _ e _) = 1 + size e
  size (KEletList _ _ _ e _) = 1 + size e
  size (KEhandle e1 e2 _)    = size e1 + size e2
  size (KEseq e1 e2 _)       = size e1 + size e2
  size _                     = 1
