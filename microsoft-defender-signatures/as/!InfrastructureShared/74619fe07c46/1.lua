-- Threat: !InfrastructureShared
-- Name: 74619fe07c46
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
