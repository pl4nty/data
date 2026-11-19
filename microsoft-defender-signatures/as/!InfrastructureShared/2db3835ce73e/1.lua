-- Threat: !InfrastructureShared
-- Name: 2db3835ce73e
-- Type: 21

local l_0_0
l_0_0 = this_sigattrlog[2].utf8p2
local l_0_1 = bm.get_current_process_startup_info()
if l_0_0 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
    if sysio.IsFileExists(l_0_3) and not mp.IsKnownFriendlyFile(l_0_3, true, false) then
      bm.request_SMS(l_0_1.ppid, "l+")
      bm.add_action("SmsAsyncScanEvent", 1000)
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.CLEAN
