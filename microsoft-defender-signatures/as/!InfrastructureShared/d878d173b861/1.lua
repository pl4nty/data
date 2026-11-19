-- Threat: !InfrastructureShared
-- Name: d878d173b861
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
