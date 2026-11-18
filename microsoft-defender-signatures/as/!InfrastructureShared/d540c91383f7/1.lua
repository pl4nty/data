-- Threat: !InfrastructureShared
-- Name: d540c91383f7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
