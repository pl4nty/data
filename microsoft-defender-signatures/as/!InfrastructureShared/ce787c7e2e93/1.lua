-- Threat: !InfrastructureShared
-- Name: ce787c7e2e93
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
