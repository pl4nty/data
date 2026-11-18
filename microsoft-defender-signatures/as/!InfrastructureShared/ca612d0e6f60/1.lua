-- Threat: !InfrastructureShared
-- Name: ca612d0e6f60
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
