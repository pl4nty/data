-- Threat: !InfrastructureShared
-- Name: 85b3e9972b8f
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\windows\\system32\\csrss.exe", 1, true) or string.find(l_0_0, "\\windows\\explorer.exe", 1, true) or string.find(l_0_0, "\\google\\chrome\\application\\chrome.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
