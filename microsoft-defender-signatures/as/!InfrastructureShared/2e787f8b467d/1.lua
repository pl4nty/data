-- Threat: !InfrastructureShared
-- Name: 2e787f8b467d
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
