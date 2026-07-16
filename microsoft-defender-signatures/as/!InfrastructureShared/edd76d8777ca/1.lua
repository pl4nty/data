-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\edd76d8777ca\1.luac 

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
l_0_2["cmd.exe"] = true
local l_0_3 = (string.lower)(l_0_1)
if not l_0_2[l_0_3] then
  return mp.CLEAN
end
local l_0_4 = (mp.GetProcessCommandLine)(l_0_0.ppid)
if isnull(l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {}
-- DECOMPILER ERROR at PC60: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC61: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R7 in 'AssignReg'

local l_0_6 = (("\\programdata\\microsoftdefendera\\").lower)(".bat")
if not containsall(l_0_6, l_0_5) then
  return mp.CLEAN
end
local l_0_7 = (mp.GetParentProcInfo)(l_0_0.ppid)
if isnull(l_0_7) or isnull(l_0_7.ppid) or isnull(l_0_7.image_path) then
  return mp.CLEAN
end
local l_0_8 = (l_0_7.image_path):match("([^\\]+)$")
if isnull(l_0_8) then
  return mp.CLEAN
end
local l_0_9 = {}
l_0_9["wscript.exe"] = true
if not l_0_9[(string.lower)(l_0_8)] then
  return mp.CLEAN
end
return mp.INFECTED

