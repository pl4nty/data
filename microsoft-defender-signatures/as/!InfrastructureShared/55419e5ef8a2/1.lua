-- Threat: !InfrastructureShared
-- Name: 55419e5ef8a2
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p1
  if IsUriKnownHostname(l_0_0) or string.find(l_0_0, ".installeranalytics.com", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = {}
  l_0_1.SIG_CONTEXT = "BM"
  l_0_1.CONTENT_SOURCE = "MSIEXEC_NRI"
  l_0_1.PROCESS_CONTEXT = "msiexec.exe"
  l_0_1.FILELESS = "false"
  l_0_1.CMDLINE_URL = "false"
  local l_0_2, l_0_3 = ExtractUrlGetReputation(l_0_0, l_0_1, true, 2, 60, false, 3000)
  if l_0_2 then
    nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY))
    return mp.INFECTED
  end
end
return mp.CLEAN
