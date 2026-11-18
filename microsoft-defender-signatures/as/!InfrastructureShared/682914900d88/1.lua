-- Threat: !InfrastructureShared
-- Name: 682914900d88
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:[CmdEscapeChar]") then
  return mp.INFECTED
end
return mp.CLEAN
