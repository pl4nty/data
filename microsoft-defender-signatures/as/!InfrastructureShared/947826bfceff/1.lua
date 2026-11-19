-- Threat: !InfrastructureShared
-- Name: 947826bfceff
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
