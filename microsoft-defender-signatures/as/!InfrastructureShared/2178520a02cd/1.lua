-- Threat: !InfrastructureShared
-- Name: 2178520a02cd
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
