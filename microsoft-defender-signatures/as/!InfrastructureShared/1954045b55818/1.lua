-- Threat: !InfrastructureShared
-- Name: 1954045b55818
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
