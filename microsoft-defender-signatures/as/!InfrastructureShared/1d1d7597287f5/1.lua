-- Threat: !InfrastructureShared
-- Name: 1d1d7597287f5
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
end
local l_0_2 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_2 == nil then
  return mp.CLEAN
end
if not contains(l_0_2, {
  "mshta.exe",
  "powershell.exe",
  "cmd.exe"
}) then
  return mp.CLEAN
end
local l_0_3 = {"http"}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = {
  "Access Level Node",
  "Gateway Token",
  "payload",
  "relaying notifying",
  "DNS Service",
  "Migrating Certificate",
  "Service Connector",
  "Restarting and",
  "Database Entry by API Tracker",
  "Detecting Level Node",
  "Restarting Key Snapshot",
  "esource Instance Hardening",
  "Response Packet",
  "Syncing  Hardening",
  "Key Snapshot",
  " Resource Allocation",
  "Backup Zone",
  "Proxy State",
  ".mp4"
}
if not contains(l_0_1, l_0_4) then
  return mp.CLEAN
end
return mp.INFECTED
