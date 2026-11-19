-- Threat: !InfrastructureShared
-- Name: 5f78b726103e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
