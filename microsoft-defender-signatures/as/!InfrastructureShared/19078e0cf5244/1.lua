-- Threat: !InfrastructureShared
-- Name: 19078e0cf5244
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
