-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000015e9_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:Wpbbin.A!cert") then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((mp.getfilename)())
if l_0_0:len() < 28 or (string.sub)(l_0_0, -28) ~= "\\windows\\system32\\wpbbin.exe" then
  return mp.CLEAN
end
return mp.INFECTED

