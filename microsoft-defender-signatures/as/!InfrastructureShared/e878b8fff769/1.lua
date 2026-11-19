-- Threat: !InfrastructureShared
-- Name: e878b8fff769
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
