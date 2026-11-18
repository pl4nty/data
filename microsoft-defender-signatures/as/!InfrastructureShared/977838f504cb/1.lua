-- Threat: !InfrastructureShared
-- Name: 977838f504cb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
