-- Threat: !InfrastructureShared
-- Name: c88d336aec32
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Ulbi.C")
  return mp.INFECTED
end
return mp.LOWFI
