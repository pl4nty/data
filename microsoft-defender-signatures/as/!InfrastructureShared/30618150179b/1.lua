-- Threat: !InfrastructureShared
-- Name: 30618150179b
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
