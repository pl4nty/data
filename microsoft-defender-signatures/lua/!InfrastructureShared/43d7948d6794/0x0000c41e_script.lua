-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43d7948d6794\0x0000c41e_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 or #l_0_1 < 70 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 == nil and l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2.image_path)
if l_0_3:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC74: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC75: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC76: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC77: Overwrote pending register: R7 in 'AssignReg'

if not ("cause")("correspondence", "could") then
  return mp.CLEAN
end
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC87: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC88: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC89: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC90: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC91: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC92: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC93: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC95: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC96: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC97: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC98: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC99: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC100: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC101: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC102: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC103: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC106: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC109: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC110: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC111: Overwrote pending register: R8 in 'AssignReg'

  if not (".shop")(".hair", "delays") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

