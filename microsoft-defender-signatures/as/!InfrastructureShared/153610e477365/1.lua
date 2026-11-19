-- Threat: !InfrastructureShared
-- Name: 153610e477365
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
