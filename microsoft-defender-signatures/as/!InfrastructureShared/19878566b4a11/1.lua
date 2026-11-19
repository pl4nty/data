-- Threat: !InfrastructureShared
-- Name: 19878566b4a11
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
