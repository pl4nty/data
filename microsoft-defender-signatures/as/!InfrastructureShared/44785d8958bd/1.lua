-- Threat: !InfrastructureShared
-- Name: 44785d8958bd
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and mp.getfilesize() < 9000 then
  return mp.INFECTED
end
return mp.CLEAN
