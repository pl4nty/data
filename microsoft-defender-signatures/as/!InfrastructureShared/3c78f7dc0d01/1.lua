-- Threat: !InfrastructureShared
-- Name: 3c78f7dc0d01
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() >= 536576 and mp.getfilesize() <= 540672 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
