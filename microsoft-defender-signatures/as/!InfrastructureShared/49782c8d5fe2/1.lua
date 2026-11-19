-- Threat: !InfrastructureShared
-- Name: 49782c8d5fe2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
