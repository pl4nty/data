-- Threat: !InfrastructureShared
-- Name: f3b3beb7bae9
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if mp.IsHipsRuleEnabled("01443614-cd74-433a-b99e-2ecdc07bfc25") or mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") then
  local l_0_0 = bm.get_current_process_startup_info()
  if l_0_0 ~= nil and l_0_0.command_line ~= nil then
    bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
    TrackPidAndTechniqueBM("BM", "T1561.002", "folderguard_blk_hips")
    return mp.INFECTED
  end
end
return mp.CLEAN
