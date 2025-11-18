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

-- DECOMPILER ERROR at PC30: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC35: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC36: Overwrote pending register: R2 in 'AssignReg'

if l_0_2 then
  return l_0_2
end
-- DECOMPILER ERROR at PC38: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC46: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC51: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC53: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC54: Overwrote pending register: R8 in 'AssignReg'

if l_0_2 and l_0_3 then
  l_0_5 = l_0_5(l_0_6, "SetupComplete.cmd", "oobe", true)
  local l_0_7 = MpCommon.BmTriggerSig
  local l_0_8 = l_0_2.ppid
  local l_0_9 = "Tampering_Setup"
  l_0_7(l_0_8, l_0_9, l_0_5 or (null))
end
do
  do
    -- DECOMPILER ERROR at PC65: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC66: Overwrote pending register: R4 in 'AssignReg'

    l_0_5 = MpCommon
    l_0_5 = l_0_5.Base64Encode
    -- DECOMPILER ERROR at PC69: Overwrote pending register: R6 in 'AssignReg'

    l_0_5 = l_0_5(l_0_6)
    l_0_3(l_0_4, l_0_5, false)
    -- DECOMPILER ERROR at PC73: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC74: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC75: Overwrote pending register: R4 in 'AssignReg'

    l_0_3 = l_0_3(l_0_4)
    -- DECOMPILER ERROR at PC79: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC80: Overwrote pending register: R4 in 'AssignReg'

    if l_0_3 then
      l_0_5 = l_0_3
      l_0_4 = l_0_4(l_0_5, "setuptype")
      if l_0_4 and l_0_4 == 2 then
        l_0_5 = mp
        l_0_5 = l_0_5.INFECTED
        return l_0_5
      end
    end
    l_0_4 = mp
    l_0_4 = l_0_4.CLEAN
    do return l_0_4 end
    -- DECOMPILER ERROR at PC94: freeLocal<0 in 'ReleaseLocals'

  end
end

