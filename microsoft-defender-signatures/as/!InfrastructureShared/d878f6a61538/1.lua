-- Threat: !InfrastructureShared
-- Name: d878f6a61538
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
