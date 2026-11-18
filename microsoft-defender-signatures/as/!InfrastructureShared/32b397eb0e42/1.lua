-- Threat: !InfrastructureShared
-- Name: 32b397eb0e42
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  if string.sub(l_0_1, -17) ~= "onedrivesetup.exe" then
    return mp.CLEAN
  end
  if l_0_0 ~= nil and l_0_0.ppid ~= nil then
    bm.request_SMS(l_0_0.ppid, "m")
    bm.add_action("SmsAsyncScanEvent", 1)
    return mp.INFECTED
  end
end
return mp.CLEAN
