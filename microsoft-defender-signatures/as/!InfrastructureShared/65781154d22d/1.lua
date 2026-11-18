-- Threat: !InfrastructureShared
-- Name: 65781154d22d
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
