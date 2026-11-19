-- Threat: !InfrastructureShared
-- Name: 1097889cbda8f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
