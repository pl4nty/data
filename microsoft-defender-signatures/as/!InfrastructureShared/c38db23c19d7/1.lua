-- Threat: !InfrastructureShared
-- Name: c38db23c19d7
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("PUA:Block:MacOS/Yontoo.B")
  return mp.INFECTED
end
return mp.LOWFI
