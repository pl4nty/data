-- Threat: !InfrastructureShared
-- Name: 5c788b49d557
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
