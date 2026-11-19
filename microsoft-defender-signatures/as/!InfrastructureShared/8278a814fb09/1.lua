-- Threat: !InfrastructureShared
-- Name: 8278a814fb09
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
