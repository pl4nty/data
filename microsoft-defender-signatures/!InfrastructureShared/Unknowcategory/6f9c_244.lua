-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6f9c_244.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if (mp.get_mpattribute)("HSTR:GolangBinary") and l_0_0 > 5242880 and l_0_0 < 15728640 then
  return mp.INFECTED
end
return mp.CLEAN

