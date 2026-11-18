-- Threat: !InfrastructureShared
-- Name: 4141b9cfe8ed
-- Type: 21
-- Includes: BMLuaLib

if versioning.GetTestMode() ~= 65000 and versioning.IsSampled(1000, true, true, true) == false then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].utf8p1
local l_0_1 = this_sigattrlog[3].utf8p1
local l_0_2 = "NRI-DNS-ALT-SRV"
local l_0_3 = string.format("%s_%s", l_0_2, l_0_0)
local l_0_4 = MpCommon.GetPersistContextCountNoPath(l_0_3)
if l_0_4 and 0 < l_0_4 then
  return mp.CLEAN
end
if isAlternateDNSServer(l_0_0) then
  local l_0_5 = "altDNS_" .. l_0_0
  local l_0_6 = MpCommon.QueryPersistContextNoPath(l_0_5, l_0_1)
  if not l_0_6 then
    MpCommon.AppendPersistContextNoPath(l_0_5, l_0_1, 3600)
  end
  local l_0_7 = MpCommon.GetPersistContextCountNoPath(l_0_5)
  if 5 < l_0_7 then
    MpCommon.AppendPersistContextNoPath(l_0_2, l_0_5, 60)
    return mp.INFECTED
  end
end
return mp.CLEAN
