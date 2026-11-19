-- Threat: !InfrastructureShared
-- Name: 135783cd76856
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
