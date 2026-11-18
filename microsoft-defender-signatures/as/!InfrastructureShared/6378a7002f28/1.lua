-- Threat: !InfrastructureShared
-- Name: 6378a7002f28
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
