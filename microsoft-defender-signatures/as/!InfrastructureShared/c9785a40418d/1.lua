-- Threat: !InfrastructureShared
-- Name: c9785a40418d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
