-- Threat: !InfrastructureShared
-- Name: 197847aa633f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
