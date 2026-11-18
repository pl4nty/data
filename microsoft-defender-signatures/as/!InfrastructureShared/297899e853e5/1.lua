-- Threat: !InfrastructureShared
-- Name: 297899e853e5
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
