-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41d75c41fd00\0x0000bec4_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
local l_0_2 = (MpCommon.GetImagePathFromPid)(l_0_0)
l_0_1 = (string.lower)(l_0_1)
if not l_0_2 and not l_0_1 then
  return mp.CLEAN
end
local l_0_3 = contains
local l_0_4 = l_0_2
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC35: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC39: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R3 in 'AssignReg'

  if not l_0_3 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC42: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC43: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC51: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC56: Overwrote pending register: R3 in 'AssignReg'

  if not l_0_3 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC58: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R3 in 'AssignReg'

  do return l_0_3 end
  -- WARNING: undefined locals caused missing assignments!
end

