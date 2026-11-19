-- Threat: !InfrastructureShared
-- Name: 67b3fea3f8be
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= "" and l_0_0 ~= nil and (string.find(l_0_0, "avast", 1, true) or string.find(l_0_0, "antivirus", 1, true) or string.find(l_0_0, "crowdstrike", 1, true) or string.find(l_0_0, "littlesnitch", 1, true) or string.find(l_0_0, "sophos", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
