-- Threat: !InfrastructureShared
-- Name: 708df615f9a9
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:FkCodec.B")
  return mp.INFECTED
end
return mp.LOWFI
