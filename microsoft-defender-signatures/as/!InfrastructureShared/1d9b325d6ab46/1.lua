-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1d9b325d6ab46\1.luac 

-- params : ...
-- function num : 0
if IsTacticObservedGlobal("Execution_CommandAndScriptingInterpreter_Metasploit", false) then
  return mp.INFECTED
end
return mp.CLEAN

