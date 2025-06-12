-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5fd786f0baf5\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC30: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC32: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC33: Overwrote pending register: R5 in 'AssignReg'

if not ("payload")("systeminfo", "hostname") then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC43: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC44: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC47: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC48: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R6 in 'AssignReg'

  if not (" iex")("invoke-expression", "COMPUTERNAME") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

