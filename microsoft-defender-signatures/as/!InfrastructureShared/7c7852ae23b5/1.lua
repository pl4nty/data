-- Threat: !InfrastructureShared
-- Name: 7c7852ae23b5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
