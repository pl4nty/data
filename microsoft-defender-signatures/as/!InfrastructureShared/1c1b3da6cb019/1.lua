-- Threat: !InfrastructureShared
-- Name: 1c1b3da6cb019
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
if bm.GetSignatureMatchDuration() > 36000000000 then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  if l_0_1:find("\\program files", 1, true) and (l_0_1:find("\\avg\\", 1, true) or l_0_1:find("\\nintendo\\", 1, true) or l_0_1:find("\\tanium\\", 1, true) or l_0_1:find("\\netskope\\", 1, true) or l_0_1:find("\\adobe\\", 1, true) or l_0_1:find("\\siemens\\", 1, true)) then
    return mp.CLEAN
  end
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1003", "tt-thresholdmet")
  return mp.INFECTED
end
return mp.CLEAN
