-- Threat: !InfrastructureShared
-- Name: 5c6171151170
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true and mp.getfilesize() < 1044480 then
  return mp.INFECTED
end
return mp.CLEAN
