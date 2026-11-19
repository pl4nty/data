-- Threat: !InfrastructureShared
-- Name: 677899dce932
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
