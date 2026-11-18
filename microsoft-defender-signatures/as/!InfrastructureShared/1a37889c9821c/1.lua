-- Threat: !InfrastructureShared
-- Name: 1a37889c9821c
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 60000000 then
  return mp.INFECTED
end
return mp.CLEAN
