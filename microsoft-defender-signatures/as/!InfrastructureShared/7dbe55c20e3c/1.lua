-- Threat: !InfrastructureShared
-- Name: 7dbe55c20e3c
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:Dnotua.B")
  return mp.INFECTED
end
return mp.LOWFI
