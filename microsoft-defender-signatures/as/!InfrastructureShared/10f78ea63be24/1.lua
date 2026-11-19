-- Threat: !InfrastructureShared
-- Name: 10f78ea63be24
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 290000 and mp.getfilesize() < 320000 then
  return mp.INFECTED
end
return mp.CLEAN
