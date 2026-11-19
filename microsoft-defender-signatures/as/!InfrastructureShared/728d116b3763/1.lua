-- Threat: !InfrastructureShared
-- Name: 728d116b3763
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:SearchProtect.A")
  return mp.INFECTED
end
return mp.LOWFI
