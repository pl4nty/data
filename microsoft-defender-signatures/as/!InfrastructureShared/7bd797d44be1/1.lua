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
local l_0_5 = {}
-- DECOMPILER ERROR at PC25: No list found for R5 , SetList fails

local l_0_6 = {}
-- DECOMPILER ERROR at PC27: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC29: No list found for R6 , SetList fails

local l_0_7 = {}
-- DECOMPILER ERROR at PC31: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC33: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC34: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC39: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC40: Overwrote pending register: R2 in 'AssignReg'

if l_0_2 then
  return l_0_2
end
-- DECOMPILER ERROR at PC42: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC43: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC49: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC51: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC64: Overwrote pending register: R4 in 'AssignReg'

if l_0_2 and l_0_3 and l_0_3 ~= "" then
  if l_0_4 then
    return l_0_4
  end
  -- DECOMPILER ERROR at PC66: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC69: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC71: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R7 in 'AssignReg'

  l_0_6 = l_0_6(l_0_7)
  -- DECOMPILER ERROR at PC75: Overwrote pending register: R7 in 'AssignReg'

  l_0_4(l_0_5, l_0_6, l_0_7)
  -- DECOMPILER ERROR at PC77: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R4 in 'AssignReg'

  l_0_4 = l_0_4()
  -- DECOMPILER ERROR at PC82: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC85: Overwrote pending register: R5 in 'AssignReg'

  if l_0_4 and l_0_5 then
    l_0_5 = l_0_5()
    -- DECOMPILER ERROR at PC91: Overwrote pending register: R7 in 'AssignReg'

    l_0_7 = l_0_7(l_0_6, 150, nil, true)
    local l_0_8 = nil
    local l_0_9 = MpCommon.BmTriggerSig
    local l_0_10 = l_0_4.ppid
    local l_0_11 = "Tampering_Setup"
    l_0_9(l_0_10, l_0_11, l_0_7 or l_0_8)
  end
  do
    do
      l_0_5 = mp
      l_0_5 = l_0_5.INFECTED
      do return l_0_5 end
      -- DECOMPILER ERROR at PC108: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC109: Overwrote pending register: R3 in 'AssignReg'

      do return l_0_3 end
      -- DECOMPILER ERROR at PC111: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

