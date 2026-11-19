-- Threat: !InfrastructureShared
-- Name: 6878abdd222d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
