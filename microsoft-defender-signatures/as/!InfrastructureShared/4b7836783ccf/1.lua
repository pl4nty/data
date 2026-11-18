-- Threat: !InfrastructureShared
-- Name: 4b7836783ccf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
