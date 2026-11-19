-- Threat: !InfrastructureShared
-- Name: 2154118495ae5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
