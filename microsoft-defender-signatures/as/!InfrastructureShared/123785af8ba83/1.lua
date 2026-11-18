-- Threat: !InfrastructureShared
-- Name: 123785af8ba83
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
