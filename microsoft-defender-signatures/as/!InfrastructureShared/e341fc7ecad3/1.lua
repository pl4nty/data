-- Threat: !InfrastructureShared
-- Name: e341fc7ecad3
-- Type: 21

function string.tohex(l_1_0)
  return (l_1_0:gsub(".", function(l_2_0)
    return string.format("%02X", string.byte(l_2_0))
  end))
end

local l_0_0 = nri.GetRawResponseBlob()
if l_0_0 ~= nil and string.len(l_0_0) < 4096 then
  local l_0_1 = {}
  l_0_1.NRI_ResponseBlob = l_0_0:tohex()
  nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH), nri.Telemetry_QUERY), l_0_1)
end
return mp.INFECTED
