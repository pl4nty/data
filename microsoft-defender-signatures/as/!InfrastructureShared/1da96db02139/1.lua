-- Threat: !InfrastructureShared
-- Name: 1da96db02139
-- Type: 21

if nri.IsResponse() then
  local l_0_0 = nri.GetRawResponseBlob()
  if l_0_0 and string.find(l_0_0, "Server: Microsoft%-IIS/7.5") then
    return mp.INFECTED
  end
end
return mp.CLEAN
