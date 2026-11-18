-- Threat: !InfrastructureShared
-- Name: 5678c51641dc
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
