-- Threat: !InfrastructureShared
-- Name: 5bd7ea457741
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if not l_0_0 or not l_0_0.image_path then
  return mp.CLEAN
end
local l_0_1 = {
  "werfault.exe",
  "svchost.exe",
  "WerFaultSecure.exe",
  "wermgr.exe",
  "NisSrv.exe",
  "mighost.exe"
}
if l_0_0 and l_0_0.image_path and Contains_any_caseinsenstive(l_0_0.image_path, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_4 = string.match(l_0_3, "/pid%s+(%d+)")
local l_0_5 = string.match(l_0_0.ppid, "/pid%s+(%d+)")
if not l_0_4 or l_0_5 then
  return mp.CLEAN
end
if l_0_5 == l_0_4 then
  return mp.CLEAN
end
MpCommon.BmTriggerSig(l_0_0.ppid, "SuspWerFaultSec_CMD_2", l_0_3)
return mp.INFECTED
