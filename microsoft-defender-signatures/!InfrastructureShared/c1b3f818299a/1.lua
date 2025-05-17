-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c1b3f818299a\1.luac 

-- params : ...
-- function num : 0
if IsTacticObservedGlobal("FirstLogonUser") then
  return mp.INFECTED
end
return mp.CLEAN

