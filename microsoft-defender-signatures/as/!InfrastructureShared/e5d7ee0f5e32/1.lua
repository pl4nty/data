-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e5d7ee0f5e32\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
if isnull(l_0_1) or isnull(l_0_1.image_path) then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1.image_path)
if StringEndsWith(l_0_2, "\\svchost.exe") or StringEndsWith(l_0_2, "\\wscript.exe") then
  return mp.CLEAN
end
return mp.INFECTED

