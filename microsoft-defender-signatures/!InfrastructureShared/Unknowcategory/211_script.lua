-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\211_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_mpattribute)("MpInternal_researchdata=GearHintContentSource=Email")
if l_0_0 then
  (mp.set_mpattribute)("Lua:MpGearO365")
  ;
  (mp.set_mpattribute)("InO365")
end
return mp.CLEAN

