-- Threat: !InfrastructureShared
-- Name: 1f781052d1ab
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
