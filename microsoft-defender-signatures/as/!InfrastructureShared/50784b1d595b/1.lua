-- Threat: !InfrastructureShared
-- Name: 50784b1d595b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
