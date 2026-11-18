-- Threat: !InfrastructureShared
-- Name: 186783a6a35ff
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
