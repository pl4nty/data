-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\bfd798abb762\1_luac 

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
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC29: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC30: Overwrote pending register: R3 in 'AssignReg'

if not ("mshta")(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC48: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC49: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC50: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC51: Overwrote pending register: R6 in 'AssignReg'

if not ("irm")("invoke-restmethod", "iwm") then
  return mp.CLEAN
end
do
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC61: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC63: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC64: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC81: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC82: Overwrote pending register: R7 in 'AssignReg'

  if not (".shop/")(".hair/", "invoke-wmimethod") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

