-- Threat: !InfrastructureShared
-- Name: 9c7848db8392
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
