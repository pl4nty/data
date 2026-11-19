-- Threat: !InfrastructureShared
-- Name: 27b7814ac09a9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
