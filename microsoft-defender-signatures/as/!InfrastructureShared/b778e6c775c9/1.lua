-- Threat: !InfrastructureShared
-- Name: b778e6c775c9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
