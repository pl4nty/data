-- Threat: !InfrastructureShared
-- Name: 199786b8aa68b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
