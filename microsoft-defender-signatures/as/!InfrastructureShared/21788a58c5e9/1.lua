-- Threat: !InfrastructureShared
-- Name: 21788a58c5e9
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
