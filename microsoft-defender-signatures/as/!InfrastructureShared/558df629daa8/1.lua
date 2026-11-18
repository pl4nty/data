-- Threat: !InfrastructureShared
-- Name: 558df629daa8
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  mp.set_mpattribute("PUA:Block:Didnarbois.A")
  return mp.INFECTED
end
return mp.LOWFI
