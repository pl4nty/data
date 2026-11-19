-- Threat: !InfrastructureShared
-- Name: 37b3d864e2ff
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  "ca.dev.cor.fi",
  "bit.ly/ltposh",
  "labtech",
  "install-lsagent"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if contains(l_0_0, "powershell") and contains(l_0_0, "downloadstring") then
  return mp.INFECTED
end
return mp.CLEAN
