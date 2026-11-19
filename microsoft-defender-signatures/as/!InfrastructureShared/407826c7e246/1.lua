-- Threat: !InfrastructureShared
-- Name: 407826c7e246
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
