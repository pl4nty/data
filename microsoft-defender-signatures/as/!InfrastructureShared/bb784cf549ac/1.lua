-- Threat: !InfrastructureShared
-- Name: bb784cf549ac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
