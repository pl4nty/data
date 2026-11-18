-- Threat: !InfrastructureShared
-- Name: 15b33a694d87
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\chrome\\application\\chrome.exe", 1, true) or string.find(l_0_0, "\\kodi\\kodi.exe", 1, true) or string.find(l_0_0, "\\apache\\bin\\httpd.exe", 1, true) or string.find(l_0_0, "\\microsoftedgecp.exe", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
