-- Threat: !InfrastructureShared
-- Name: 4578fa6d7cda
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
