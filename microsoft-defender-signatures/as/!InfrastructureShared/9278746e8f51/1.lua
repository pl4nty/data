-- Threat: !InfrastructureShared
-- Name: 9278746e8f51
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
