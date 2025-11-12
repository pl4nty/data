-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7bd797d44be1\1.luac 

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
local l_0_2 = checkParentCmdlineCaseInsensitive
local l_0_3 = l_0_0
local l_0_4 = {}
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC25: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC26: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC31: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R2 in 'AssignReg'

  if l_0_2 then
    return l_0_2
  end
  -- DECOMPILER ERROR at PC34: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC35: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC42: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC43: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC45: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R6 in 'AssignReg'

  if l_0_2 and l_0_3 then
    l_0_3(l_0_4, l_0_5, "")
  end
  -- DECOMPILER ERROR at PC48: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC51: Overwrote pending register: R5 in 'AssignReg'

  l_0_3(l_0_4, l_0_5, false)
  -- DECOMPILER ERROR at PC56: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC57: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R4 in 'AssignReg'

  l_0_3(l_0_4)
  -- DECOMPILER ERROR at PC60: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC61: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R3 in 'AssignReg'

  if l_0_3 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC69: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC70: Overwrote pending register: R3 in 'AssignReg'

  do return l_0_3 end
  -- WARNING: undefined locals caused missing assignments!
end

