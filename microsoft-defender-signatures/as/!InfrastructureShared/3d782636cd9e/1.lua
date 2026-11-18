-- Threat: !InfrastructureShared
-- Name: 3d782636cd9e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
