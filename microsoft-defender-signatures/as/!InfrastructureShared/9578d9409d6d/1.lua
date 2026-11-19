-- Threat: !InfrastructureShared
-- Name: 9578d9409d6d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
