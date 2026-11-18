-- Threat: !InfrastructureShared
-- Name: dd78f7f5df1e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
