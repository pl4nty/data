-- Threat: !InfrastructureShared
-- Name: 2e7895144c12
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
