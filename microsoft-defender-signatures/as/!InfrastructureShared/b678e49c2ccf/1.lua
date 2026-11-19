-- Threat: !InfrastructureShared
-- Name: b678e49c2ccf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
