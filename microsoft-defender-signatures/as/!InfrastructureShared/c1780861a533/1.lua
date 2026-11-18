-- Threat: !InfrastructureShared
-- Name: c1780861a533
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 27000 then
  return mp.INFECTED
end
return mp.CLEAN
