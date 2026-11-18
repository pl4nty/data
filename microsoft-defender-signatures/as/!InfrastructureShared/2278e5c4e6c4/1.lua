-- Threat: !InfrastructureShared
-- Name: 2278e5c4e6c4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
