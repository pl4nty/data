-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43d7cd146c6b\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  return mp.INFECTED
end
return mp.CLEAN

