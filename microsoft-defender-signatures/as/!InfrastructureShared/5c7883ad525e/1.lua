-- Threat: !InfrastructureShared
-- Name: 5c7883ad525e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
