-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7fd759abbdd8\0x00000bb5_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if #l_0_1 <= 60 then
  return mp.CLEAN
end
if l_0_1 ~= nil then
  l_0_1 = (string.lower)(l_0_1)
end
local l_0_2 = nil
local l_0_3 = {}
-- DECOMPILER ERROR at PC34: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC37: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC38: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC42: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC43: Overwrote pending register: R3 in 'AssignReg'

if not l_0_3 then
  return l_0_3
end
-- DECOMPILER ERROR at PC45: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC46: Overwrote pending register: R3 in 'AssignReg'

if l_0_3 == nil and l_0_3.image_path == nil then
  return mp.CLEAN
end
local l_0_4 = (string.lower)(l_0_3.image_path)
if not l_0_4 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC65: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC66: Overwrote pending register: R7 in 'AssignReg'

local l_0_5 = l_0_4:match("brave.exe")
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = "\\\\appdata\\\\"
local l_0_7 = false
-- DECOMPILER ERROR at PC75: Overwrote pending register: R8 in 'AssignReg'

l_0_7 = (("opera.exe").StringRegExpSearch)(l_0_6, l_0_5)
if l_0_7 == false then
  return mp.CLEAN
end
return mp.INFECTED

