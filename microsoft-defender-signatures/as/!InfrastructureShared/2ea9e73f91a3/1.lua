-- Threat: !InfrastructureShared
-- Name: 2ea9e73f91a3
-- Type: 21

local l_0_0 = {cert = "unk"}
local l_0_1 = nri.GetRawSSLCertificate()
if l_0_1 then
  l_0_1 = MpCommon.Base64Encode(l_0_1)
  if l_0_1 then
    l_0_0 = {cert = l_0_1}
  end
end
nri.AddTelemetry(nri.Telemetry_HOSTNAME, l_0_0)
return mp.INFECTED
