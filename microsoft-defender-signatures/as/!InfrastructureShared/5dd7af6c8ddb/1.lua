-- Threat: !InfrastructureShared
-- Name: 5dd7af6c8ddb
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = mp.GetParentProcInfo(l_0_0)
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
l_0_2 = string.lower(l_0_2)
local l_0_3 = {
  "--force-rxrpc",
  "--force-esp",
  "unshare",
  "algif_aead",
  "af_rxrpc",
  "socket",
  "splice",
  "af_alg",
  "clone_newuser",
  "clone_newnet",
  "authencesn",
  "unshare"
}
if contains(l_0_2, l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
