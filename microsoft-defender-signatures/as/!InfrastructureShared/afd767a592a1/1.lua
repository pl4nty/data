-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\afd767a592a1\1.luac 

-- params : ...
-- function num : 0
if IsTacticObservedGlobal("credentialdumping_concrete") then
  return mp.INFECTED
end
return mp.CLEAN

