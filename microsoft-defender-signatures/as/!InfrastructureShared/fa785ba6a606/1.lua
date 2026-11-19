-- Threat: !InfrastructureShared
-- Name: fa785ba6a606
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
