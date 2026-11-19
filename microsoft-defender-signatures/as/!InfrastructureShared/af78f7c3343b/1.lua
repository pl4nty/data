-- Threat: !InfrastructureShared
-- Name: af78f7c3343b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
