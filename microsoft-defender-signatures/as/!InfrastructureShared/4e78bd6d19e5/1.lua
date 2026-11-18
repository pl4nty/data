-- Threat: !InfrastructureShared
-- Name: 4e78bd6d19e5
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
