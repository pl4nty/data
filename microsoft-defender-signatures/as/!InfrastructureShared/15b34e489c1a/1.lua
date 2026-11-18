-- Threat: !InfrastructureShared
-- Name: 15b34e489c1a
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -13) == "\\iexplore.exe" or string.sub(l_0_0, -11) == "\\chrome.exe" or string.sub(l_0_0, -18) == "\\microsoftedge.exe" or string.sub(l_0_0, -20) == "\\microsoftedgecp.exe" or string.sub(l_0_0, -12) == "\\firefox.exe" then
  return mp.INFECTED
end
return mp.CLEAN
