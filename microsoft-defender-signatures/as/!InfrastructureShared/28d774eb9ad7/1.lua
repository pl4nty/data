-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\28d774eb9ad7\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC33: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC34: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC36: Overwrote pending register: R3 in 'AssignReg'

do
  local l_0_2 = (("wscript.exe").GetProcessElevationAndIntegrityLevel)("cscript.exe")
  -- DECOMPILER ERROR at PC41: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R5 in 'AssignReg'

  if l_0_2 and next("regsvr32.exe") and l_0_2.IntegrityLevel and MpCommon.SECURITY_MANDATORY_HIGH_RID <= l_0_2.IntegrityLevel and IsProcNameInParentProcessTree("CMDHSTR", "mshta.exe") then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

