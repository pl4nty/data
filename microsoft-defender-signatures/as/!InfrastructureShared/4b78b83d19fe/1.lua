-- Threat: !InfrastructureShared
-- Name: 4b78b83d19fe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
