-- Threat: !InfrastructureShared
-- Name: 35be3e17fc06
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("PUA:Block:Hiddad.B")
  return mp.INFECTED
end
return mp.LOWFI
