-- Threat: !InfrastructureShared
-- Name: 4f78b832d2de
-- Type: 21

if peattributes.isexe and peattributes.no_security and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
