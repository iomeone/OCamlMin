{-# LANGUAGE
  FlexibleContexts
  #-}

module TypeInference.Constant where
  import CompilerState
  import Syntax.Constant
  import Types

  import Control.Monad.State

  typeOfConstant :: MonadState CompilerState m => Constant -> m Type
  typeOfConstant (Cint _)   = return Tint
  typeOfConstant (Cbool _)  = return Tbool
  typeOfConstant Cnil       = do
    v <- freshTypeVar
    return $ Tlist v
  typeOfConstant Cunit      = return Tunit
