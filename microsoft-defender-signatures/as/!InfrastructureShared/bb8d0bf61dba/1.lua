-- Threat: !InfrastructureShared
-- Name: bb8d0bf61dba
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("PUA:Block:MacTweaker.C")
  return mp.INFECTED
end
return mp.LOWFI
