-- Threat: !InfrastructureShared
-- Name: 788d14e97e3a
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:TuneupMyMac.B")
  return mp.INFECTED
end
return mp.LOWFI
