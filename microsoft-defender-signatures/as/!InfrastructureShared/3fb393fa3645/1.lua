-- Threat: !InfrastructureShared
-- Name: 3fb393fa3645
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
if string.find(l_0_0, "rdpclip.exe", 1, true) or string.find(l_0_0, "tsprintlogin.exe", 1, true) or string.find(l_0_0, "tsscanlist.exe", 1, true) or string.find(l_0_0, "uplaunch.exe", 1, true) or string.find(l_0_0, "svchost.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
