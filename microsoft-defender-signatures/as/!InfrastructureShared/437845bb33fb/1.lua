-- Threat: !InfrastructureShared
-- Name: 437845bb33fb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
