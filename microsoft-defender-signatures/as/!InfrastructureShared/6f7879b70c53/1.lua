-- Threat: !InfrastructureShared
-- Name: 6f7879b70c53
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
