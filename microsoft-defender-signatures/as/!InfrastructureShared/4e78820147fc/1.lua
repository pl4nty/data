-- Threat: !InfrastructureShared
-- Name: 4e78820147fc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
