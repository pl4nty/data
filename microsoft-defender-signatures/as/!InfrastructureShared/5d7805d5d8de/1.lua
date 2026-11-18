-- Threat: !InfrastructureShared
-- Name: 5d7805d5d8de
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
