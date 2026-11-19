-- Threat: !InfrastructureShared
-- Name: 2c78ddab8714
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() >= 1910000 and mp.getfilesize() <= 1920000 then
  return mp.INFECTED
end
return mp.CLEAN
