-- Threat: !InfrastructureShared
-- Name: 5d786eb68b9b
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 420000 and mp.getfilesize() < 450000 then
  return mp.INFECTED
end
return mp.CLEAN
