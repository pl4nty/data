-- Threat: !InfrastructureShared
-- Name: 687804257af1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
