-- Threat: !InfrastructureShared
-- Name: 4c784be1b70e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
