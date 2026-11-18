-- Threat: !InfrastructureShared
-- Name: 2e78a1f6aa1e
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
