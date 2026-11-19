-- Threat: !InfrastructureShared
-- Name: 1f6b33cec3f57
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[11].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = {
  "/dev/tcp/",
  "bash -i >& /dev/",
  "mkfifo",
  "nc -e /bin/",
  "ncat -e /bin/",
  "| bash",
  "| sh",
  "-o /tmp/",
  "crontab -e",
  "crontab -r",
  "/etc/cron",
  "authorized_keys",
  "/etc/shadow",
  "+x /tmp/",
  "chmod 777",
  "operator.admin",
  "pair approve",
  "device-pair",
  ".openclaw/config",
  ".openclaw/credentials"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1059", "Execution")
add_parents()
return mp.INFECTED
