-- Threat: !InfrastructureShared
-- Name: 4878c6825c6a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
