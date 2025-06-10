-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\30d7d5ddabe2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = (string.gsub)((string.lower)(l_0_1), "[%\'\"]%)?%+%(?[%\'\"]", "")
local l_0_2 = {}
-- DECOMPILER ERROR at PC54: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC55: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC56: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R5 in 'AssignReg'

if not ("captcha")("robot", "malware") then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC67: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC69: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC70: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC71: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC74: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC81: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC82: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC83: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC96: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC97: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC98: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC99: Overwrote pending register: R6 in 'AssignReg'

  if not (".cloud")(".press", "b64 decode:") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

