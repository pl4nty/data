-- Threat: !InfrastructureShared
-- Name: b6b3c5ffecec
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "\\teams.exe", 1, true) or string.find(l_0_0, "\\teams\\update.exe", 1, true) or string.find(l_0_0, "\\csrss.exe", 1, true) or string.find(l_0_0, "\\lsass.exe", 1, true) or string.find(l_0_0, "\\svchost.exe", 1, true) or string.find(l_0_0, "\\explorer.exe", 1, true)) then
  return mp.CLEAN
end
return mp.INFECTED
