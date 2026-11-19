-- Threat: !InfrastructureShared
-- Name: a1b3048f6c9a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not isnull(l_0_0) and not isnull(l_0_0.command_line) then
  local l_0_1 = l_0_0.command_line
  local l_0_2 = l_0_1:match("%)%.b64decode%(%s*b?['\"]([A-Za-z0-9%+/=]+)['\"]%)")
  if l_0_2 ~= nil and string.len(l_0_2) < 1024 then
    local l_0_3 = bm.get_current_process_startup_info()
    bm.request_SMS(l_0_3.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 100)
    return mp.INFECTED
  end
end
return mp.CLEAN
