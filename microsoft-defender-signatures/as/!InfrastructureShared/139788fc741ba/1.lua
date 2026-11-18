-- Threat: !InfrastructureShared
-- Name: 139788fc741ba
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 4900000 and mp.getfilesize() < 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
