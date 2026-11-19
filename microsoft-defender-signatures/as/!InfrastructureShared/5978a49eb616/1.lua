-- Threat: !InfrastructureShared
-- Name: 5978a49eb616
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
