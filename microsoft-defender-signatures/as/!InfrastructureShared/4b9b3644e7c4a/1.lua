-- Threat: !InfrastructureShared
-- Name: 4b9b3644e7c4a
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  AddResearchData(l_0_0.ppid, true)
  return mp.INFECTED
end
return mp.CLEAN
