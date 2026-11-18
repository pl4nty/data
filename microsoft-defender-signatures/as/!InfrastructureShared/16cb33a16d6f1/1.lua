-- Threat: !InfrastructureShared
-- Name: 16cb33a16d6f1
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[6].utf8p1)
elseif this_sigattrlog[7].matched then
  l_0_0 = mp.GetExecutablesFromCommandLine(this_sigattrlog[7].utf8p1)
end
if l_0_0 ~= nil then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    if string.find(l_0_2, "/bash", -5, true) or string.find(l_0_2, "/zsh", -4, true) or string.find(l_0_2, "/wget", -5, true) or string.find(l_0_2, "/curl", -5, true) or string.find(l_0_2, "/sh", -3, true) or string.find(l_0_2, "/python", -7, true) or string.find(l_0_2, "/ruby", -5, true) or string.find(l_0_2, "/dd", -3, true) or string.find(l_0_2, "/xattr", -6, true) or string.find(l_0_2, "/launchctl", -10, true) or string.find(l_0_2, "/launchd", -8, true) or string.find(l_0_2, "/syslogd", -8, true) or string.find(l_0_2, "/sysdiagnose", -11, true) or string.find(l_0_2, "/sandboxd", -9, true) or string.find(l_0_2, "/usbagent", -9, true) or string.find(l_0_2, "/trustd", -7, true) or string.find(l_0_2, "/xpcproxy", -9, true) then
      if sysio.IsFileExists(l_0_2) then
        bm.add_related_file(l_0_2)
      end
      TrackPidAndTechniqueBM("BM", "T1036", "DefenseEvasion")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
