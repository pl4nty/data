-- Threat: !InfrastructureShared
-- Name: 7178ad2f043a
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
