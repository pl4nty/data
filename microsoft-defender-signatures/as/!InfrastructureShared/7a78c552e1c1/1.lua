-- Threat: !InfrastructureShared
-- Name: 7a78c552e1c1
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 2048000 then
  return mp.INFECTED
end
return mp.CLEAN
