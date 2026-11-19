-- Threat: !InfrastructureShared
-- Name: 76789d32882f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 30473 then
  return mp.INFECTED
end
return mp.CLEAN
