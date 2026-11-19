-- Threat: !InfrastructureShared
-- Name: 257876013d46
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
