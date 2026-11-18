-- Threat: !InfrastructureShared
-- Name: 3c78c42f2e61
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
