-- Threat: !InfrastructureShared
-- Name: 7c7860c0a2f3
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
