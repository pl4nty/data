-- Threat: !InfrastructureShared
-- Name: 9f783dd451d0
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
