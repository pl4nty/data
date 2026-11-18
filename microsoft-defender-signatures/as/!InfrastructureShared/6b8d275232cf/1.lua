-- Threat: !InfrastructureShared
-- Name: 6b8d275232cf
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Didnarbois.B")
  return mp.INFECTED
end
return mp.LOWFI
