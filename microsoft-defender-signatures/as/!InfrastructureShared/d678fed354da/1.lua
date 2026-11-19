-- Threat: !InfrastructureShared
-- Name: d678fed354da
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
