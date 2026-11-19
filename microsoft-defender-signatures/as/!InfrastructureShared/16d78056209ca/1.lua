-- Threat: !InfrastructureShared
-- Name: 16d78056209ca
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
