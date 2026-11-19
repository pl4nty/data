-- Threat: !InfrastructureShared
-- Name: bb78748cf1d4
-- Type: 21

if mp.HSTR_WEIGHT < 4 and mp.HSTR_WEIGHT > 1 then
  mp.set_mpattribute("HSTR:Nivdort.EXP05")
end
return mp.INFECTED
