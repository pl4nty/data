-- Threat: !InfrastructureShared
-- Name: 18f78e27440a0
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
