-- Threat: !InfrastructureShared
-- Name: 3a789e5b6d22
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
