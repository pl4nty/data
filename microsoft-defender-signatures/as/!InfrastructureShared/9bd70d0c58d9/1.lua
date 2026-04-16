-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9bd70d0c58d9\1.luac 

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
local l_0_2 = {}
l_0_2["mshta.exe"] = true
if not l_0_2[(string.lower)(l_0_1)] then
  return mp.CLEAN
end
return mp.INFECTED

