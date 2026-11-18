-- Threat: !InfrastructureShared
-- Name: 4978a922fd83
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
