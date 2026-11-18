-- Threat: !InfrastructureShared
-- Name: 23789a8897c1
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
