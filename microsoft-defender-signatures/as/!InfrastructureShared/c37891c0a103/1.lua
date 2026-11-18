-- Threat: !InfrastructureShared
-- Name: c37891c0a103
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
