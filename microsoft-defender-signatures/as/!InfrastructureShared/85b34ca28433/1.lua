-- Threat: !InfrastructureShared
-- Name: 85b34ca28433
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) then
      if mp.IsKnownFriendlyFile(l_0_3, true, false) then
        mp.ReportLowfi(l_0_3, 1394183950)
      else
        TrackFileAndTechnique(l_0_3, "T1543.003:exec_service_binary", 1000)
        mp.ReportLowfi(l_0_3, 3656319915)
      end
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
