-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\76d70395c76f\0x0000c455_luac 

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
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if #l_0_3 < 50 then
  return mp.CLEAN
end
local l_0_4 = contains
local l_0_5 = l_0_3
local l_0_6 = {}
-- DECOMPILER ERROR at PC57: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC61: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC62: Overwrote pending register: R4 in 'AssignReg'

if not l_0_4 then
  return l_0_4
end
-- DECOMPILER ERROR at PC67: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC96: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC97: Overwrote pending register: R6 in 'AssignReg'

l_0_5 = l_0_5(l_0_6, l_0_4)
if l_0_5 then
  l_0_5 = mp
  l_0_5 = l_0_5.INFECTED
  return l_0_5
end
l_0_5 = MpCommon
l_0_5 = l_0_5.StringRegExpSearch
-- DECOMPILER ERROR at PC107: Overwrote pending register: R6 in 'AssignReg'

l_0_5 = l_0_5(l_0_6, l_0_3)
if l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN

