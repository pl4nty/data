-- Threat: !InfrastructureShared
-- Name: ee8d37685eac
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Adload.L")
  return mp.INFECTED
end
return mp.LOWFI
