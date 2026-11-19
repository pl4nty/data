-- Threat: !InfrastructureShared
-- Name: 8061bbd39d6f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
