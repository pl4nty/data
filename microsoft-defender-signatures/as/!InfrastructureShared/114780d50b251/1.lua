-- Threat: !InfrastructureShared
-- Name: 114780d50b251
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
