-- Threat: !InfrastructureShared
-- Name: e97857fcf9d1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
