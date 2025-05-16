-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3fb364652b31\0x00006d98_luac 

-- params : ...
-- function num : 0
if isTamperProtectionOn() then
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN

