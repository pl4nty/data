-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\111d76f6b22f9\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = (string.lower)(l_0_1)
end
local l_0_2 = (MpCommon.GetImagePathFromPid)(l_0_0)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = contains
local l_0_4 = l_0_2
local l_0_5 = {}
-- DECOMPILER ERROR at PC36: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC40: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R3 in 'AssignReg'

if not l_0_3 then
  return l_0_3
end
-- DECOMPILER ERROR at PC46: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC52: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC53: Overwrote pending register: R4 in 'AssignReg'

if not l_0_4 then
  return l_0_4
end
-- DECOMPILER ERROR at PC55: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC56: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC60: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC64: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC67: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC68: Overwrote pending register: R8 in 'AssignReg'

if l_0_4 ~= nil and l_0_5 ~= nil and l_0_5:match("cmd.exe") == "explorer.exe" then
  return mp.INFECTED
end
-- DECOMPILER ERROR at PC75: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC76: Overwrote pending register: R5 in 'AssignReg'

return l_0_5

