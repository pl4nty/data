-- Threat: !InfrastructureShared
-- Name: 31788aa2ad8f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 2200000 and mp.getfilesize() < 2500000 then
  return mp.INFECTED
end
return mp.CLEAN
