-- Threat: !InfrastructureShared
-- Name: 10f78d239ccec
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
