-- Threat: !InfrastructureShared
-- Name: 2b78538ca8e9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
