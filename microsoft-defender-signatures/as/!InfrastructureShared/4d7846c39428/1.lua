-- Threat: !InfrastructureShared
-- Name: 4d7846c39428
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
