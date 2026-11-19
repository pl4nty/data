-- Threat: !InfrastructureShared
-- Name: b54058321d33
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
