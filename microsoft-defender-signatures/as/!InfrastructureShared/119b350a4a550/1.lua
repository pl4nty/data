-- Threat: !InfrastructureShared
-- Name: 119b350a4a550
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].ppid
  if IsTacticObservedForPid(l_0_0, "webshell_parent") then
    local l_0_1, l_0_2 = bm.get_process_relationships()
    for l_0_3, l_0_4 in ipairs(l_0_2) do
      TrackPidAndTechniqueBM(l_0_4.ppid, "T1505.003", "webshell_childproc", 28800)
    end
    local l_0_5
    if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
      l_0_5 = this_sigattrlog[5].utf8p2
      if l_0_5 ~= nil then
        l_0_5 = string.lower(l_0_5)
        local l_0_6 = mp.GetExecutablesFromCommandLine(l_0_5)
        for l_0_7, l_0_8 in ipairs(l_0_6) do
          l_0_8 = mp.ContextualExpandEnvironmentVariables(l_0_8)
          if sysio.IsFileExists(l_0_8) then
            bm.add_related_file(l_0_8)
          end
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
