-- Threat: !InfrastructureShared
-- Name: 7cbee1e099a8
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Nomibi.C")
  return mp.INFECTED
end
return mp.LOWFI
