-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\37d76a3c6e20\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_0.image_path) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
if isnull(l_0_1) or isnull(l_0_1.ppid) or isnull(l_0_1.image_path) then
  return mp.CLEAN
end
local l_0_2 = (l_0_1.image_path):match("([^\\]+)$")
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
l_0_3["services.exe"] = true
l_0_3["svchost.exe"] = true
l_0_3["hys9eas_epmsystem4.exe"] = true
if l_0_3[(string.lower)(l_0_2)] then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC72: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC73: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC74: Overwrote pending register: R6 in 'AssignReg'

if ("backup")((("oracle").lower)(l_0_2), l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED

