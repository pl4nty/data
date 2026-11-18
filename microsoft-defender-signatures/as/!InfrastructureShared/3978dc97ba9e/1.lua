-- Threat: !InfrastructureShared
-- Name: 3978dc97ba9e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
