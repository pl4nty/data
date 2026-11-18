-- Threat: !InfrastructureShared
-- Name: 25b39d421697
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\chrome\\application\\chrome.exe", 1, true) or string.find(l_0_0, "\\microsoftedge", 1, true) or string.find(l_0_0, "windows\\system32\\svchost.exe", 1, true) or string.find(l_0_0, "\\sophos\\", 1, true) or string.find(l_0_0, "\\application\\browser.exe", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED
