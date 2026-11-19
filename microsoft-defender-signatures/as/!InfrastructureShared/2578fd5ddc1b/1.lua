-- Threat: !InfrastructureShared
-- Name: 2578fd5ddc1b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
