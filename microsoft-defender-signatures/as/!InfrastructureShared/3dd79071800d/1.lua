-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3dd79071800d\1.luac 

-- params : ...
-- function num : 0
if not isTamperProtectionOn() then
  return mp.CLEAN
end
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 and l_0_0.ppid then
  local l_0_1 = (mp.GetScannedPPID)()
  if l_0_1 == "" or l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
  ;
  (MpCommon.BmTriggerSig)(l_0_0.ppid, "TamperingPlatformReset", l_0_2)
end
do
  return mp.INFECTED
end

