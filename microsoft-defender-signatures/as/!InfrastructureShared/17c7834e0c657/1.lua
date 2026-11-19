-- Threat: !InfrastructureShared
-- Name: 17c7834e0c657
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
