-- Threat: !InfrastructureShared
-- Name: 4e789fc5f9e4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
