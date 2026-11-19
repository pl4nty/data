-- Threat: !InfrastructureShared
-- Name: 84b30f93aaa0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  if l_0_0.command_line ~= nil then
    bm_AddRelatedFileFromCommandLine(l_0_0.command_line)
  end
  bm.request_SMS(l_0_0.ppid, "m")
  bm.add_action("SmsAsyncScanEvent", 1000)
end
return mp.INFECTED
