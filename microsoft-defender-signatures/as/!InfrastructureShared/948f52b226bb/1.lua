-- Threat: !InfrastructureShared
-- Name: 948f52b226bb
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(ActiveMime)") or mp.get_mpattribute("PACKED_WITH:(Base64)") then
  return mp.INFECTED
end
return mp.LOWFI
