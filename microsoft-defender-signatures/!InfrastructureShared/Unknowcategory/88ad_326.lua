-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\88ad_326.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 < 8388608 or l_0_0 > 17825792 then
  return mp.CLEAN
end
if (mp.get_mpattribute)("HSTR:PYINSTALLER") and (mp.get_mpattribute)("HSTR:Linux/NativeAPIDirectoryEnumuerate.A") then
  return mp.INFECTED
end
return mp.CLEAN

