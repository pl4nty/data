-- Threat: !InfrastructureShared
-- Name: 8c61a9aca698
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
