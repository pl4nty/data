-- Threat: !InfrastructureShared
-- Name: 4c61cdc7cc31
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
