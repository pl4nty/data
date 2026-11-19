-- Threat: !InfrastructureShared
-- Name: 2f780e7964d1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
