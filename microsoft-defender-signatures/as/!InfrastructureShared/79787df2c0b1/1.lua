-- Threat: !InfrastructureShared
-- Name: 79787df2c0b1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
