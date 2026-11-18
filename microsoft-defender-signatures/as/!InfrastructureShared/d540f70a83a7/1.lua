-- Threat: !InfrastructureShared
-- Name: d540f70a83a7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
