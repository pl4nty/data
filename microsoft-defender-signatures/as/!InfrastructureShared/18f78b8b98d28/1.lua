-- Threat: !InfrastructureShared
-- Name: 18f78b8b98d28
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
