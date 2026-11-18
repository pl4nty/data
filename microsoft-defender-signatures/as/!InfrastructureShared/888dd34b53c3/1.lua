-- Threat: !InfrastructureShared
-- Name: 888dd34b53c3
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:TuneupMyMac.A")
  return mp.INFECTED
end
return mp.LOWFI
