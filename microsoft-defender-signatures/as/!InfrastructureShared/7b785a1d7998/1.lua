-- Threat: !InfrastructureShared
-- Name: 7b785a1d7998
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
