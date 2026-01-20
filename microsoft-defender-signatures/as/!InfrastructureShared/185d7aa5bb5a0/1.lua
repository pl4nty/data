-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\185d7aa5bb5a0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC4: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC5: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("sqlservr.exe").GetParentProcInfo)()
-- DECOMPILER ERROR at PC10: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC14: Overwrote pending register: R3 in 'AssignReg'

do
  if not (l_0_1.image_path):match("([^\\]+)$") then
    local l_0_2, l_0_3 = not l_0_1 or not "sqlps.exe" or ""
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

  if Contains_any_caseinsenstive(l_0_2, l_0_0) then
    local l_0_4 = nil
    if (mp.GetScannedPPID)() == "" or (mp.GetScannedPPID)() == nil then
      return mp.CLEAN
    end
    local l_0_5 = nil
    if (mp.GetProcessCommandLine)((mp.GetScannedPPID)()) then
      (MpCommon.BmTriggerSig)(l_0_1.ppid, "PFApp_SqlSrvExploit_A", (mp.GetProcessCommandLine)((mp.GetScannedPPID)()))
      return mp.INFECTED
    end
  end
  do
    return mp.CLEAN
  end
end

