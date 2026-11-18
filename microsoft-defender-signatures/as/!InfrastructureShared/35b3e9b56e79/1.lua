-- Threat: !InfrastructureShared
-- Name: 35b3e9b56e79
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if IsADConnectRole() then
  l_0_0 = "Ad Connect"
elseif IsADConnectCloudSyncRole() then
  l_0_0 = "Ad Connect Cloud Sync"
elseif IsADFSRole() then
  l_0_0 = "ADFS"
end
if l_0_0 == nil then
  return mp.CLEAN
end
bm.add_related_string("HybridServerRole", l_0_0, bm.RelatedStringBMReport)
return mp.INFECTED
