-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4d7b34f89178e\1_luac 

-- params : ...
-- function num : 0
if isTamperProtectionOn() then
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN

