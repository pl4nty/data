-- Threat: !InfrastructureShared
-- Name: 4578acbaa8c3
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
