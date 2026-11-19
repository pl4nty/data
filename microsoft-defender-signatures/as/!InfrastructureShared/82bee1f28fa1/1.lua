-- Threat: !InfrastructureShared
-- Name: 82bee1f28fa1
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:Framaroot.A")
  return mp.INFECTED
end
return mp.LOWFI
