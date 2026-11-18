-- Threat: !InfrastructureShared
-- Name: 71b3fd665e75
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
if IsTacticObservedForParents(l_0_1, "bas_tool_safebreach_process", 3) then
  bm.request_SMS(l_0_1, "M")
  bm.add_action("SmsAsyncScanEvent", 1)
  return mp.INFECTED
end
return mp.CLEAN
