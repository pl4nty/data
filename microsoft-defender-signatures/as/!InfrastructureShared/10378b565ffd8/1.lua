-- Threat: !InfrastructureShared
-- Name: 10378b565ffd8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
