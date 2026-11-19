-- Threat: !InfrastructureShared
-- Name: 13e7804adf725
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
