-- Threat: !InfrastructureShared
-- Name: 121787bba8063
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
