-- Threat: !InfrastructureShared
-- Name: 2a783595f76d
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
