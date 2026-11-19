-- Threat: !InfrastructureShared
-- Name: 1327875a80593
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
