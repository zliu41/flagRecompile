module Plugin (plugin) where

import Control.Monad.IO.Class
import Foo
import qualified GHC.Plugins as P

plugin :: P.Plugin
plugin = P.defaultPlugin {P.installCoreToDos = \_opts -> pure . install, P.pluginRecompile = P.flagRecompile}

install :: [P.CoreToDo] -> [P.CoreToDo]
install = (todo :)
  where
    todo :: P.CoreToDo
    todo = P.CoreDoPluginPass ("my pass") $ \guts -> do
      liftIO . putStrLn $ "Plugin runs! " <> show (foo 0)
      pure guts
