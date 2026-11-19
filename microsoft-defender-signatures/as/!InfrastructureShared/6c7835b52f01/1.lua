-- Threat: !InfrastructureShared
-- Name: 6c7835b52f01
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
