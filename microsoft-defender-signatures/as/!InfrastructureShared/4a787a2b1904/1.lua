-- Threat: !InfrastructureShared
-- Name: 4a787a2b1904
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
