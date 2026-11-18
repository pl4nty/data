-- Threat: !InfrastructureShared
-- Name: 52eb3f681fff6
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1, l_0_2
local l_0_3 = 20
local l_0_4 = 20
local l_0_5 = 100
local l_0_6 = "ScanOrBruteforce_"
local l_0_7, l_0_8, l_0_9, l_0_10, l_0_11
if this_sigattrlog[24].matched and this_sigattrlog[24].ppid ~= nil then
  l_0_0 = this_sigattrlog[24].ppid
  l_0_1 = this_sigattrlog[24].utf8p2
  l_0_2 = "SSH"
end
if this_sigattrlog[25].matched and this_sigattrlog[25].ppid ~= nil then
  l_0_0 = this_sigattrlog[25].ppid
  l_0_1 = this_sigattrlog[25].utf8p2
  l_0_2 = "Telnet"
end
if this_sigattrlog[26].matched and this_sigattrlog[26].ppid ~= nil then
  l_0_0 = this_sigattrlog[26].ppid
  l_0_1 = this_sigattrlog[26].utf8p2
  l_0_2 = "FTP"
end
if this_sigattrlog[27].matched and this_sigattrlog[27].ppid ~= nil then
  l_0_0 = this_sigattrlog[27].ppid
  l_0_1 = this_sigattrlog[27].utf8p2
  l_0_2 = "SMB"
end
if this_sigattrlog[28].matched and this_sigattrlog[28].ppid ~= nil then
  l_0_0 = this_sigattrlog[28].ppid
  l_0_1 = this_sigattrlog[28].utf8p2
  l_0_2 = "LDAP"
end
if this_sigattrlog[29].matched and this_sigattrlog[29].ppid ~= nil then
  l_0_0 = this_sigattrlog[29].ppid
  l_0_1 = this_sigattrlog[29].utf8p2
  l_0_2 = "Kerberos"
end
if this_sigattrlog[30].matched and this_sigattrlog[30].ppid ~= nil then
  l_0_0 = this_sigattrlog[30].ppid
  l_0_1 = this_sigattrlog[30].utf8p2
  l_0_2 = "RDP"
end
if l_0_2 == nil or l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
l_0_8 = string.match(l_0_1, "DestIp=([^;]*);")
if l_0_8 == nil or l_0_8 == "" then
  return mp.CLEAN
end
l_0_7 = l_0_6 .. l_0_2
l_0_9, l_0_10 = pcall(MpCommon.RollingQueueCreate, l_0_7, l_0_5, l_0_3)
if not l_0_9 then
  return mp.CLEAN
end
l_0_9, l_0_10 = pcall(MpCommon.RollingQueueAppend, l_0_7, l_0_8, "", l_0_3)
if not l_0_9 then
  return mp.CLEAN
end
l_0_9, l_0_10 = pcall(MpCommon.RollingQueueCount, l_0_7)
if not l_0_9 then
  return mp.CLEAN
end
l_0_11 = l_0_10
if l_0_4 < l_0_11 then
  TrackPidAndTechniqueBM(l_0_0, "T1110", "CredentialAccess")
  return mp.INFECTED
end
return mp.CLEAN
