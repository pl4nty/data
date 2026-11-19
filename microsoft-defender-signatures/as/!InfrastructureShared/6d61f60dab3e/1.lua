-- Threat: !InfrastructureShared
-- Name: 6d61f60dab3e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
