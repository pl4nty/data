-- Threat: !InfrastructureShared
-- Name: 1c7817a29760
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
