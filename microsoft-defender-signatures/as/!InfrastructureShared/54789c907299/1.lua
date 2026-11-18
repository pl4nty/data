-- Threat: !InfrastructureShared
-- Name: 54789c907299
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
