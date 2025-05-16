-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000000fb_luac 

-- params : ...
-- function num : 0
if (MpCommon.GetPersistContextCountNoPath)("TaintedMachineML_Low") > 0 then
  return mp.INFECTED
end
return mp.CLEAN

