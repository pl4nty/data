-- Threat: !InfrastructureShared
-- Name: 217814f868d1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
