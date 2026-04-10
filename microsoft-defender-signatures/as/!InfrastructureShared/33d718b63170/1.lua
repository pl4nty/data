-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\33d718b63170\1.luac 

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
l_0_2["python.exe"] = true
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

local l_0_6 = (("--rdp_password_file_path").lower)("ipykernel_launcher")
if contains(l_0_6, l_0_5) then
  return mp.CLEAN
end
return mp.INFECTED

