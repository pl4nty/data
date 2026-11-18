-- Threat: !InfrastructureShared
-- Name: a078f6ed40a9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
