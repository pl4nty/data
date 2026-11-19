-- Threat: !InfrastructureShared
-- Name: 4d782b777c21
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
