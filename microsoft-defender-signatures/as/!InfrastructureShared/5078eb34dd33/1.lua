-- Threat: !InfrastructureShared
-- Name: 5078eb34dd33
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
