-- Threat: !InfrastructureShared
-- Name: 12b78ea382c9b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
