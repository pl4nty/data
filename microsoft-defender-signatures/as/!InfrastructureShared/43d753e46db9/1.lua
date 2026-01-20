-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43d753e46db9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if not (l_0_0.image_path):match("([^\\]+)$") then
    local l_0_1, l_0_2 = not l_0_0 or not l_0_0.image_path or ""
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  if (string.lower)(l_0_1) == "w3wp.exe" then
    local l_0_3 = nil
    if (mp.GetScannedPPID)() == "" or (mp.GetScannedPPID)() == nil then
      return mp.CLEAN
    end
    local l_0_4 = nil
    if (mp.GetProcessCommandLine)((mp.GetScannedPPID)()) then
      (MpCommon.BmTriggerSig)(l_0_0.ppid, "PFApp_IISSrvExploit_A", (mp.GetProcessCommandLine)((mp.GetScannedPPID)()))
      return mp.INFECTED
    end
  end
  do
    return mp.CLEAN
  end
end

