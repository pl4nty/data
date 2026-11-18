-- Threat: !InfrastructureShared
-- Name: 1ea3411c984931
-- Type: 21

local l_0_0 = nri.GetSSLCertificate()
local l_0_1 = {
  useragent = nri.GetHttpRequestHeader("User-Agent"),
  Subject = l_0_0.Subject,
  Issuer = l_0_0.Issuer,
  ValidFrom = l_0_0.ValidFrom,
  ValidTo = l_0_0.ValidTo,
  FingerprintSha1 = l_0_0.FingerprintSha1,
  FingerprintSha256 = l_0_0.FingerprintSha256
}
nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_1)
return mp.INFECTED
