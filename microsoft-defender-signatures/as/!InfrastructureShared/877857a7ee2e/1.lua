-- Threat: !InfrastructureShared
-- Name: 877857a7ee2e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
