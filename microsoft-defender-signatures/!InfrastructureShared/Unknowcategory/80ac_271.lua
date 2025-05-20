-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\80ac_271.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("SCPT:RansomNote:")
if l_0_0 ~= nil and #l_0_0 >= 5 then
  (mp.set_mpattribute)("MpDisableCaching")
  return mp.INFECTED
end
return mp.CLEAN

