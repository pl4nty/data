-- Threat: !InfrastructureShared
-- Name: 6d7856c6225b
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
