-- Threat: !InfrastructureShared
-- Name: 3f97869a7e671
-- Type: 21

if mp.HSTR_WEIGHT < 3 then
  return mp.INFECTED
end
return mp.CLEAN
