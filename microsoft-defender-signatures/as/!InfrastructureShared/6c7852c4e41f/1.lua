-- Threat: !InfrastructureShared
-- Name: 6c7852c4e41f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
