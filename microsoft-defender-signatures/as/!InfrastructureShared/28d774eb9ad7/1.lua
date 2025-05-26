-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\28d774eb9ad7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC25: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC26: Overwrote pending register: R3 in 'AssignReg'

if (".sysmain.sdb")(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC57: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC58: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC60: Overwrote pending register: R5 in 'AssignReg'

do
  local l_0_4 = (("wscript.exe").GetProcessElevationAndIntegrityLevel)("cscript.exe")
  -- DECOMPILER ERROR at PC65: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R7 in 'AssignReg'

  if l_0_4 and next("regsvr32.exe") and l_0_4.IntegrityLevel and MpCommon.SECURITY_MANDATORY_HIGH_RID <= l_0_4.IntegrityLevel and IsProcNameInParentProcessTree("CMDHSTR", "mshta.exe") then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

