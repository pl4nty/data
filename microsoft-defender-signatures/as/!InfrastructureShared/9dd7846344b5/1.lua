-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9dd7846344b5\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpCmdLineFoundB64") then
  return mp.CLEAN
end
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = (string.lower)(l_0_1)
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC38: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC39: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC40: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R5 in 'AssignReg'

if not ("c:\\")("d:\\", "e:\\") then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC51: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC52: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC53: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC54: Overwrote pending register: R6 in 'AssignReg'

if not ("iex")("invoke-expression", "f:\\") then
  return mp.CLEAN
end
do
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC64: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC71: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC74: Overwrote pending register: R7 in 'AssignReg'

  if not ("\\documents\\")("\\users\\", "g:\\") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

