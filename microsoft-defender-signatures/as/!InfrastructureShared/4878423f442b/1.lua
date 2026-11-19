-- Threat: !InfrastructureShared
-- Name: 4878423f442b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
