-- Threat: !InfrastructureShared
-- Name: 5c78f0fe754a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
