-- Threat: !InfrastructureShared
-- Name: 3d78b330af50
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
