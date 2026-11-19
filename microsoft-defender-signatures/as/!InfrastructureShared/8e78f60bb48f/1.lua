-- Threat: !InfrastructureShared
-- Name: 8e78f60bb48f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 3500000 and mp.getfilesize() < 5600000 then
  return mp.INFECTED
end
return mp.CLEAN
