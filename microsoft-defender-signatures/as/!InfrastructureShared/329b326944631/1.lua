-- Threat: !InfrastructureShared
-- Name: 329b326944631
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and next(l_0_0) and l_0_0.command_line then
  local l_0_1 = string.lower(l_0_0.command_line)
  bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
  bm.request_SMS(l_0_0.ppid, "M")
  bm.add_action("SmsAsyncScanEvent", 1)
  return mp.INFECTED
end
return mp.CLEAN
