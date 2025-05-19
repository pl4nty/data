-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\687c_226.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("BM_DEVICE_DRIVER") and (mp.get_mpattribute)("RPF:TopLevelFile") then
  return mp.INFECTED
end
return mp.CLEAN

