-- Threat: !InfrastructureShared
-- Name: 28789a228f00
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
