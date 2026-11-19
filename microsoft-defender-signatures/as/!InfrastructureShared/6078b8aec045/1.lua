-- Threat: !InfrastructureShared
-- Name: 6078b8aec045
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
