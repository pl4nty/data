-- Threat: !InfrastructureShared
-- Name: 93bedb7fcc43
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:Dnotua.C")
  return mp.INFECTED
end
return mp.LOWFI
