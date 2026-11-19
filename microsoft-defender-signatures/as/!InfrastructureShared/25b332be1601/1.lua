-- Threat: !InfrastructureShared
-- Name: 25b332be1601
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.command_line == nil then
  return mp.CLEAN
end
if mp.IsHipsRuleEnabled("c1db55ab-c21a-4637-bb3f-a12568109d35") then
  local l_0_1, l_0_2 = GetDetectionThresholdMetReason(l_0_0.ppid)
  if l_0_1 and l_0_2 ~= 2 then
    bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
    local l_0_3, l_0_4 = bm.get_process_relationships()
    for l_0_5, l_0_6 in ipairs(l_0_4) do
      local l_0_7 = mp.bitand(l_0_6.reason_ex, bm.RELATIONSHIP_INJECTION)
      if l_0_7 == bm.RELATIONSHIP_INJECTION then
        bm.add_threat_process(l_0_6.ppid)
      end
    end
    AddResearchData(l_0_0.ppid, true)
    return mp.INFECTED
  end
end
return mp.CLEAN
