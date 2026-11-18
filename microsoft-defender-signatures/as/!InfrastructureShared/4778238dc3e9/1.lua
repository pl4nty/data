-- Threat: !InfrastructureShared
-- Name: 4778238dc3e9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
