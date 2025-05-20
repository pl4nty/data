-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\886a_321.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["isxagent.exe"] = true
l_0_1["totalrecoveryprosetup.exe"] = true
if l_0_1[(string.lower)(l_0_0:match("\\([^\\]+)$"))] then
  return mp.CLEAN
end
return mp.INFECTED

