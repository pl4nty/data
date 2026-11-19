-- Threat: !InfrastructureShared
-- Name: d540fe5939c9
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
