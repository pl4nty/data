-- Threat: !InfrastructureShared
-- Name: 54783dcab289
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 340000 and mp.getfilesize() < 385000 then
  return mp.INFECTED
end
return mp.CLEAN
