-- Threat: !InfrastructureShared
-- Name: 11178f12586c4
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 33000 and mp.getfilesize() < 37000 then
  return mp.INFECTED
end
return mp.CLEAN
