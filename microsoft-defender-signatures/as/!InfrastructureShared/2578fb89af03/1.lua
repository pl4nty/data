-- Threat: !InfrastructureShared
-- Name: 2578fb89af03
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
