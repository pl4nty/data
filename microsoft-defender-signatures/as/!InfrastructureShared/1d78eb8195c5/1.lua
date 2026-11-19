-- Threat: !InfrastructureShared
-- Name: 1d78eb8195c5
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
