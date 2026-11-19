-- Threat: !InfrastructureShared
-- Name: 3fb319815fd3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    if string.find(l_0_2, ".json", -5, true) or string.find(l_0_2, ".yaml", -5, true) or string.find(l_0_2, ".xml", -4, true) or string.find(l_0_2, ".jpg", -4, true) or string.find(l_0_2, ".gz", -3, true) or string.find(l_0_2, "/etc/", 1, true) or string.find(l_0_2, "/boot/grub/", 1, true) or string.find(l_0_2, "/dev/shm/", 1, true) or string.find(l_0_2, "/var/run/", 1, true) then
      if sysio.IsFileExists(l_0_2) then
        bm.add_related_file(l_0_2)
      end
      TrackPidAndTechniqueBM("BM", "T1222", "DefenseEvasion")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
