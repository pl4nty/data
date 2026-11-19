-- Threat: !InfrastructureShared
-- Name: a561c7f1035b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
