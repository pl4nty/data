-- Threat: !InfrastructureShared
-- Name: 4478260c8f80
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
