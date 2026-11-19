-- Threat: !InfrastructureShared
-- Name: 175406b40a5be
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
