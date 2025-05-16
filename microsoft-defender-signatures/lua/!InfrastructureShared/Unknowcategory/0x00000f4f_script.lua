-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000f4f_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("RPF:TopLevelFile") or not (mp.get_mpattribute)("pea_isexe") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)()
if (string.find)(l_0_0, "ObservationDetectors", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

