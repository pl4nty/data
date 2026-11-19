-- Threat: !InfrastructureShared
-- Name: 6f78b7005b71
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
