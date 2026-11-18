-- Threat: !InfrastructureShared
-- Name: 5bb398b054aa
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\msedge.exe", 1, true) or string.find(l_0_0, "\\chrome.exe", 1, true) or string.find(l_0_0, "\\opera.exe", 1, true) or string.find(l_0_0, "\\browser.exe", 1, true) or string.find(l_0_0, "\\brave.exe", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = bm.get_current_process_startup_info()
  bm.request_SMS(l_0_1.ppid, "M")
  bm.add_action("SmsAsyncScanEvent", 100)
  return mp.INFECTED
end
return mp.CLEAN
