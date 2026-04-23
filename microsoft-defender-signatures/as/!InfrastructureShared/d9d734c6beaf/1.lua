-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d9d734c6beaf\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_0.image_path) then
  return mp.CLEAN
end
local l_0_1 = (l_0_0.image_path):match("([^\\]+)$")
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)(l_0_0.ppid)
if isnull(l_0_2) or isnull(l_0_2.ppid) or isnull(l_0_2.image_path) then
  return mp.CLEAN
end
local l_0_3 = (l_0_2.image_path):match("([^\\]+)$")
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {}
l_0_4["sqlservr.exe"] = true
if not l_0_4[(string.lower)(l_0_1)] and not l_0_4[(string.lower)(l_0_3)] then
  return mp.CLEAN
end
return mp.INFECTED

