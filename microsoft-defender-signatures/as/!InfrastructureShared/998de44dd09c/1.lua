-- Threat: !InfrastructureShared
-- Name: 998de44dd09c
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:MacOS/Yontoo")
  return mp.INFECTED
end
return mp.LOWFI
