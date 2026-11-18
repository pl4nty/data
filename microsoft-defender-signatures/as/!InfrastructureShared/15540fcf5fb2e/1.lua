-- Threat: !InfrastructureShared
-- Name: 15540fcf5fb2e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
