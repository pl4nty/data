-- Threat: !InfrastructureShared
-- Name: 4778a19f960e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
