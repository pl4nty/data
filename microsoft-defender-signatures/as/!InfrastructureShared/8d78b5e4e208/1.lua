-- Threat: !InfrastructureShared
-- Name: 8d78b5e4e208
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
