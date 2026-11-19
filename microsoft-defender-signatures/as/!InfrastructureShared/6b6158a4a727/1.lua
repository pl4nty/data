-- Threat: !InfrastructureShared
-- Name: 6b6158a4a727
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
