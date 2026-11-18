-- Threat: !InfrastructureShared
-- Name: c47874264fd1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
