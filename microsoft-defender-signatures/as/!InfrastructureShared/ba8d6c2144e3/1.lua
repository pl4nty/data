-- Threat: !InfrastructureShared
-- Name: ba8d6c2144e3
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Jawego.G")
  return mp.INFECTED
end
return mp.LOWFI
