-- Threat: !InfrastructureShared
-- Name: 212b3375dcda9
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[9].utf8p1
  l_0_0 = this_sigattrlog[9].ppid
end
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[10].utf8p1
  l_0_0 = this_sigattrlog[10].ppid
end
if this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[11].utf8p1
  l_0_0 = this_sigattrlog[11].ppid
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[1].utf8p2
  l_0_1 = this_sigattrlog[1].ppid
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[2].utf8p2
  l_0_1 = this_sigattrlog[2].ppid
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[3].utf8p2
  l_0_1 = this_sigattrlog[3].ppid
end
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[4].utf8p2
  l_0_1 = this_sigattrlog[4].ppid
end
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[5].utf8p2
  l_0_1 = this_sigattrlog[5].ppid
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[6].utf8p2
  l_0_1 = this_sigattrlog[6].ppid
end
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[7].utf8p2
  l_0_1 = this_sigattrlog[7].ppid
end
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[8].utf8p2
  l_0_1 = this_sigattrlog[8].ppid
end
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
l_0_4 = string.match(l_0_3, "/var/spool/mail/([^;]*)")
if l_0_4 ~= nil and l_0_4 ~= "" then
  l_0_5 = "/var/mail/" .. l_0_4
end
if sysio.IsFileExists(l_0_2) and string.find(l_0_3, ">", 1, true) and (string.find(l_0_3, l_0_2, 1, true) or l_0_5 ~= nil and l_0_5 == l_0_2) and bm.GetSignatureMatchDuration() < 20000000 then
  if l_0_0 ~= nil then
    TrackPidAndTechniqueBM(l_0_0, "T1070.002", "DefenseEvasion")
  end
  if l_0_1 ~= nil then
    TrackPidAndTechniqueBM(l_0_1, "T1070.002", "DefenseEvasion")
  end
  addRelatedProcess()
  if string.find(l_0_3, "/var/log/mdatp_cron_job.log", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
