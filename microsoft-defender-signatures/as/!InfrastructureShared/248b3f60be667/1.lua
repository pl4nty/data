-- Threat: !InfrastructureShared
-- Name: 248b3f60be667
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[7].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[7].utf8p2)
elseif this_sigattrlog[8].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[8].utf8p2)
end
if l_0_0 ~= nil then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    if string.find(l_0_2, "/tmp/", 1, true) or string.find(l_0_2, "/var/tmp/", 1, true) or string.find(l_0_2, "/var/mail/", 1, true) or string.find(l_0_2, "/var/spool/mail/", 1, true) or string.find(l_0_2, "/var/lock/", 1, true) then
      TrackPidAndTechniqueBM("BM", "T1222", "DefenseEvasion")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
