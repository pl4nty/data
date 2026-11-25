-- Threat: !InfrastructureShared
-- Name: 149619868351b
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
