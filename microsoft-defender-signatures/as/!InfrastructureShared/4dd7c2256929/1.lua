-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4dd7c2256929\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = (mp.GetScannedPPID)()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
local l_0_4 = (MpCommon.GetImagePathFromPid)(l_0_2)
l_0_3 = (string.lower)(l_0_3)
if not l_0_4 and not l_0_3 then
  return mp.CLEAN
end
local l_0_5 = contains
local l_0_6 = l_0_4
local l_0_7 = {}
-- DECOMPILER ERROR at PC58: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC62: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R5 in 'AssignReg'

if not l_0_5 then
  return l_0_5
end
-- DECOMPILER ERROR at PC65: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC66: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC69: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC72: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC73: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC76: Overwrote pending register: R9 in 'AssignReg'

l_0_5, l_0_7 = l_0_5(l_0_6, l_0_7), {"powershell", "cmd.exe"}
if not l_0_5 then
  l_0_5 = mp
  l_0_5 = l_0_5.CLEAN
  return l_0_5
end
l_0_5 = contains
-- DECOMPILER ERROR at PC85: Overwrote pending register: R6 in 'AssignReg'

l_0_5, l_0_7 = l_0_5(l_0_6, l_0_7), {"powershell -", "iex", "iwr"}
if not l_0_5 then
  l_0_5 = mp
  l_0_5 = l_0_5.CLEAN
  return l_0_5
end
l_0_5 = mp
l_0_5 = l_0_5.INFECTED
return l_0_5

