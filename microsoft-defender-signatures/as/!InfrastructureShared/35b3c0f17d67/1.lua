-- Threat: !InfrastructureShared
-- Name: 35b3c0f17d67
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if mp.IsHipsRuleEnabled("5beb7efe-fd9a-4556-801d-275e5ffc04cc") or mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") then
  local l_0_0 = bm.get_current_process_startup_info()
  if l_0_0 ~= nil and l_0_0.command_line ~= nil then
    bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
    TrackPidAndTechniqueBM("BM", "T1561.002", "folderguard_blk_hips")
    return mp.INFECTED
  end
end
return mp.CLEAN
