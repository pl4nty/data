-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\865c_298.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if peattributes.isdll == true and (mp.get_mpattribute)("NID:Win64/IcedId.PAH!MTB") and l_0_0 > 1572864 and l_0_0 < 1638400 then
  return mp.INFECTED
end
return mp.CLEAN

