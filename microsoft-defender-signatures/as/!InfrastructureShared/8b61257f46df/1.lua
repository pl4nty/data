-- Threat: !InfrastructureShared
-- Name: 8b61257f46df
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
