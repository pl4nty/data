-- Threat: !InfrastructureShared
-- Name: 2578c4fa27bf
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
