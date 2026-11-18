-- Threat: !InfrastructureShared
-- Name: 5b413f7c104a
-- Type: 21

local l_0_0 = nri.GetRawRequestBlob()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.find(l_0_0, "\254SMB........\005\000")
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_3 = string.sub(l_0_0, l_0_2 + 1, l_0_2 + 1024)
if not string.find(l_0_3, "DH2Q", 1, true) then
  return mp.CLEAN
end
local l_0_4
if this_sigattrlog[3] ~= nil and this_sigattrlog[3].matched then
  l_0_4 = this_sigattrlog[3].utf8p1
end
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = "SmbDh2qFlood_" .. l_0_4
local l_0_6 = MpCommon.GetCurrentTimeT() .. "_" .. #l_0_0 .. "_" .. tostring(nri.GetConnectionString())
MpCommon.AppendPersistContextNoPath(l_0_5, l_0_6, 30)
if MpCommon.GetPersistContextCountNoPath(l_0_5) <= 2 then
  return mp.CLEAN
end
local l_0_7 = {srcip = l_0_4}
nri.AddTelemetry(nri.Telemetry_HOSTNAME, l_0_7)
return mp.INFECTED
