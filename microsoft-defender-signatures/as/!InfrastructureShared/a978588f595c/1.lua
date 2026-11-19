-- Threat: !InfrastructureShared
-- Name: a978588f595c
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
