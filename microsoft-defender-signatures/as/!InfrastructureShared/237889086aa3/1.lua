-- Threat: !InfrastructureShared
-- Name: 237889086aa3
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
