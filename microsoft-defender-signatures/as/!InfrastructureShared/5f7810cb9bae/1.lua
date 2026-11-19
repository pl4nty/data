-- Threat: !InfrastructureShared
-- Name: 5f7810cb9bae
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
