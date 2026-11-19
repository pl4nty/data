-- Threat: !InfrastructureShared
-- Name: 189b38536cde5
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1
if this_sigattrlog[9].matched and this_sigattrlog[9].ppid ~= nil then
  l_0_0 = this_sigattrlog[9].ppid
  l_0_1 = this_sigattrlog[9].utf8p2
else
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "DestIp=([^;]*);")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = 30
local l_0_4 = "Outgoing_SSH_Brute_" .. tostring(l_0_0) .. "_"
local l_0_5 = 0
local l_0_6 = 10
local l_0_7 = l_0_4 .. l_0_2
if MpCommon.AtomicCounterValue(l_0_7) == nil then
  MpCommon.AtomicCounterSet(l_0_7, 1, l_0_3)
else
  l_0_5 = MpCommon.AtomicCounterAdd(l_0_7, 1) + 1
  if l_0_6 < l_0_5 then
    TrackPidAndTechniqueBM(l_0_0, "T1110", "CredentialAccess")
    return mp.INFECTED
  end
end
return mp.CLEAN
