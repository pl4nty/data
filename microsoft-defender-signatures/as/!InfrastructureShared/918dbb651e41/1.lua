-- Threat: !InfrastructureShared
-- Name: 918dbb651e41
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Jawego.D")
  return mp.INFECTED
end
return mp.LOWFI
