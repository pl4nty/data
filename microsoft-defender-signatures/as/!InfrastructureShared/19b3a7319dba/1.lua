-- Threat: !InfrastructureShared
-- Name: 19b3a7319dba
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -10) == "chrome.exe" then
  return mp.CLEAN
end
return mp.INFECTED
