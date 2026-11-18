-- Threat: !InfrastructureShared
-- Name: 4cfb3e1134039
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\msedge.exe", 1, true) or string.find(l_0_0, "\\chrome.exe", 1, true) or string.find(l_0_0, "\\firefox.exe", 1, true) or string.find(l_0_0, "\\opera.exe", 1, true) or string.find(l_0_0, "\\brave.exe", 1, true) then
    return mp.CLEAN
  end
  local l_0_1, l_0_2 = pcall(reportBmInfo)
  if not l_0_1 and l_0_2 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
  end
  local l_0_3 = bm.get_current_process_startup_info()
  if l_0_3 and l_0_3.ppid then
    bm.request_SMS(l_0_3.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 100)
  end
  return mp.INFECTED
end
return mp.CLEAN
