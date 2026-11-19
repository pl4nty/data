-- Threat: !InfrastructureShared
-- Name: 1de78f796b843
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
