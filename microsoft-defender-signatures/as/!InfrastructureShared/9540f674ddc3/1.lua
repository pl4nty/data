-- Threat: !InfrastructureShared
-- Name: 9540f674ddc3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
