-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\705c_251.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if (mp.get_mpattribute)("NID:Win64/Qakbot.PAN!MTB") and l_0_0 > 131072 and l_0_0 < 327680 then
  return mp.INFECTED
end
return mp.CLEAN

