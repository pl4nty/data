-- Threat: !InfrastructureShared
-- Name: d178bfd67988
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
