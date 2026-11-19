-- Threat: !InfrastructureShared
-- Name: 2e878ed75e33a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
