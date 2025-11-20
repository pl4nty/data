-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9ad7f0a43a06\1.luac 

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

-- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC46: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R5 in 'AssignReg'

l_0_2(l_0_3, l_0_4, l_0_5)
-- DECOMPILER ERROR at PC50: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC51: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC52: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC56: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC59: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC65: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC66: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC70: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC73: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC79: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC80: Overwrote pending register: R9 in 'AssignReg'

if l_0_2 and l_0_3 and l_0_3 == 2 then
  if l_0_4 and l_0_5 then
    l_0_7 = l_0_7("oobe", "", nil, true)
    local l_0_8 = nil
    local l_0_9 = MpCommon.BmTriggerSig
    local l_0_10 = l_0_4.ppid
    local l_0_11 = "Tampering_Setup"
    l_0_9(l_0_10, l_0_11, l_0_7 or l_0_8)
  end
  do
    do
      -- DECOMPILER ERROR at PC92: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC93: Overwrote pending register: R5 in 'AssignReg'

      do return l_0_5 end
      -- DECOMPILER ERROR at PC95: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC96: Overwrote pending register: R3 in 'AssignReg'

      do return l_0_3 end
      -- DECOMPILER ERROR at PC98: freeLocal<0 in 'ReleaseLocals'

    end
  end
end

