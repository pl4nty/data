-- Threat: !InfrastructureShared
-- Name: 11db34bb743c1
-- Type: 21
-- Includes: BMLuaLib

if not IsADConnectRole() then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 ~= nil and l_0_0:match("\\ADSyncMSA%w%w%w%w%w%$") then
  return mp.INFECTED
end
return mp.CLEAN
