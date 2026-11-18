-- Threat: !InfrastructureShared
-- Name: 5678660b491b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
