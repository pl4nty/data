-- Threat: !InfrastructureShared
-- Name: 97be31fb6fd1
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Dnotua.AS")
  return mp.INFECTED
end
return mp.LOWFI
