-- Threat: !InfrastructureShared
-- Name: 227800f4d91b
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
