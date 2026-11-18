-- Threat: !InfrastructureShared
-- Name: 114780d6e5801
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
