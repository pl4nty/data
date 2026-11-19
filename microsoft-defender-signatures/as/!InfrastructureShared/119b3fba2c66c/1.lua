-- Threat: !InfrastructureShared
-- Name: 119b3fba2c66c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  "\\temp\\nessus_",
  "ansible-async",
  "\\software\\checker\\reports\\",
  "ccm_update"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
return mp.INFECTED
