-- Threat: !InfrastructureShared
-- Name: 9d782bbc617b
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 1000000 and mp.getfilesize() <= 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
