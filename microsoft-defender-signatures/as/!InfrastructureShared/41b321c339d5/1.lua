-- Threat: !InfrastructureShared
-- Name: 41b321c339d5
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  ["Trojan:Win32/TIImpersonation.A!sms"] = true,
  ["Trojan:Win32/TIImpersonation.B!sms"] = true,
  ["Trojan:Win32/W3WP_BackdoorDLL"] = true,
  ["Trojan:Win32/ShellMemoryArtifacts.B"] = true,
  ["Trojan:Win32/ShellMemoryArtifacts.C"] = true
}
if l_0_1[l_0_0] then
  return mp.CLEAN
end
return mp.INFECTED
