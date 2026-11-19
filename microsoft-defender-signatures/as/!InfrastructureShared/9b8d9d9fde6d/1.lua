-- Threat: !InfrastructureShared
-- Name: 9b8d9d9fde6d
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Hula.A")
  return mp.INFECTED
end
return mp.LOWFI
