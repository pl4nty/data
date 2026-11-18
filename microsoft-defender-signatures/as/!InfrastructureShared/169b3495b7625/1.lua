-- Threat: !InfrastructureShared
-- Name: 169b3495b7625
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[5].matched then
  if this_sigattrlog[5].utf8p2 == nil or this_sigattrlog[5].utf8p2 == "" then
    return mp.CLEAN
  end
  l_0_0 = this_sigattrlog[5].utf8p2
  if not string.match(l_0_0, "[%s%/]%.npl$") then
    return mp.CLEAN
  end
end
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_2 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    bm.trigger_sig("BmTraverseTreeBlockMac", "Detected", l_0_4.ppid)
  end
end
TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandAndScriptingInterpreter_ExactMatch")
return mp.INFECTED
