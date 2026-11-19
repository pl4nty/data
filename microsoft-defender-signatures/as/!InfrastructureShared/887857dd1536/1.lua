-- Threat: !InfrastructureShared
-- Name: 887857dd1536
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
