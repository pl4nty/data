-- Threat: !InfrastructureShared
-- Name: 3178b05767d6
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
