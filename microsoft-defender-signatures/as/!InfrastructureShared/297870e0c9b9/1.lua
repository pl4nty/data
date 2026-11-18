-- Threat: !InfrastructureShared
-- Name: 297870e0c9b9
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
