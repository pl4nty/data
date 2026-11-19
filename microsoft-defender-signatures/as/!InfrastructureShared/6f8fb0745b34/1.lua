-- Threat: !InfrastructureShared
-- Name: 6f8fb0745b34
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(ActiveMime)") or mp.get_mpattribute("PACKED_WITH:(Base64)") then
  return mp.INFECTED
end
return mp.LOWFI
