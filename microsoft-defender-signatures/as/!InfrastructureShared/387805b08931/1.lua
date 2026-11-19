-- Threat: !InfrastructureShared
-- Name: 387805b08931
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
