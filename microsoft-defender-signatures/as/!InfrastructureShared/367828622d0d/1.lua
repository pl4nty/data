-- Threat: !InfrastructureShared
-- Name: 367828622d0d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
