-- Threat: !InfrastructureShared
-- Name: 3b7804c8a7ad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
