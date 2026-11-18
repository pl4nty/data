-- Threat: !InfrastructureShared
-- Name: 297824c7cffd
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
