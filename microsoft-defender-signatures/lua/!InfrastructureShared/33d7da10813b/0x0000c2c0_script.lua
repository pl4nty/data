-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\33d7da10813b\0x0000c2c0_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1.image_path)
if l_0_2 == nil then
  return mp.CLEAN
end
if not l_0_2:find("\\explorer.exe") then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_3 or #l_0_3 <= 50 then
  return mp.CLEAN
end
local l_0_4 = "[\\.\\-]replace[\\s(]+[\'\"]([^\'\"])+[\'\"]"
local l_0_5, l_0_6 = (MpCommon.StringRegExpSearch)(l_0_4, l_0_3)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_7, l_0_8 = (string.gsub)(l_0_3, "%" .. l_0_6, "")
if not l_0_7 or not l_0_8 then
  return mp.CLEAN
end
if l_0_8 and tonumber(l_0_8) < 10 then
  return mp.CLEAN
end
local l_0_9 = contains
local l_0_10 = l_0_3
local l_0_11 = {}
-- DECOMPILER ERROR at PC90: No list found for R11 , SetList fails

-- DECOMPILER ERROR at PC94: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC95: Overwrote pending register: R9 in 'AssignReg'

if l_0_9 then
  return l_0_9
end
-- DECOMPILER ERROR at PC97: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC100: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC101: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC102: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC103: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC104: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC105: Overwrote pending register: R17 in 'AssignReg'

l_0_9, l_0_11 = l_0_9(l_0_10, l_0_11), {"curl", "iex", "http", "invoke-expression", "mshta", "msiexec"}
if l_0_9 then
  l_0_9 = mp
  l_0_9 = l_0_9.INFECTED
  return l_0_9
end
l_0_9 = mp
l_0_9 = l_0_9.CLEAN
return l_0_9

