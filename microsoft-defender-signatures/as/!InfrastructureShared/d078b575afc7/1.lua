-- Threat: !InfrastructureShared
-- Name: d078b575afc7
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 100000 then
  return mp.CLEAN
end
return mp.INFECTED
