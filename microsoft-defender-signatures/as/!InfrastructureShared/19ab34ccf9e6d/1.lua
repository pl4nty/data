-- Threat: !InfrastructureShared
-- Name: 19ab34ccf9e6d
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil and this_sigattrlog[4].utf8p2 ~= "" then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 ~= "" and l_0_0 ~= nil and (string.find(l_0_0, "vmware", 1, true) or string.find(l_0_0, "virtualbox", 1, true) or string.find(l_0_0, "parallels", 1, true) or string.find(l_0_0, "prl_tools", 1, true) or string.find(l_0_0, "vboxservice", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
