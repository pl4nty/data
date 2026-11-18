-- Threat: !InfrastructureShared
-- Name: a578d2e9bde3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
