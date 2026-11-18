-- Threat: !InfrastructureShared
-- Name: 85787545551f
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 328064 then
  return mp.INFECTED
end
return mp.CLEAN
