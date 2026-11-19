-- Threat: !InfrastructureShared
-- Name: 4f789d691894
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
