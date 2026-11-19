-- Threat: !InfrastructureShared
-- Name: 7bb3f82515d3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[4].utf8p2)
end
if l_0_0 ~= nil then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    l_0_2 = string.lower(l_0_2)
    if string.find(l_0_2, ".json", -5, true) or string.find(l_0_2, ".yaml", -5, true) or string.find(l_0_2, ".xml", -4, true) or string.find(l_0_2, ".jpg", -4, true) or string.find(l_0_2, ".gz", -3, true) or string.find(l_0_2, ".pdf", -4, true) or string.find(l_0_2, ".mp3", -4, true) or string.find(l_0_2, ".doc", -4, true) or string.find(l_0_2, ".docx", -5, true) or string.find(l_0_2, ".py", -3, true) or string.find(l_0_2, ".png", -4, true) or string.find(l_0_2, ".nib", -4, true) or string.find(l_0_2, ".rtf", -4, true) or string.find(l_0_2, ".xls", -4, true) or string.find(l_0_2, ".txt", -4, true) or string.find(l_0_2, ".wmv", -4, true) or string.find(l_0_2, "/etc/", 1, true) or string.find(l_0_2, "/tmp/", 1, true) or string.find(l_0_2, "/var/", 1, true) or string.find(l_0_2, "/users/", 1, true) then
      if sysio.IsFileExists(l_0_2) then
        bm.add_related_file(l_0_2)
      end
      TrackPidAndTechniqueBM("BM", "T1222.002", "DefenseEvasion_PermissionModification_MacChmodToExec")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
