-- Threat: !InfrastructureShared
-- Name: 197839ca4c38
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
