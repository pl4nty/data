-- Threat: !InfrastructureShared
-- Name: 7c78897922e5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
