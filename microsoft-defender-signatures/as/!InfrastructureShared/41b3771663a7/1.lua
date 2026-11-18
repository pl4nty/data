-- Threat: !InfrastructureShared
-- Name: 41b3771663a7
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].ppid
  if IsTacticObservedForPid(l_0_0, "webshell_parent") then
    local l_0_1, l_0_2 = bm.get_process_relationships()
    for l_0_3, l_0_4 in ipairs(l_0_2) do
      TrackPidAndTechniqueBM(l_0_4.ppid, "T1505.003", "webshell_childproc", 28800)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
