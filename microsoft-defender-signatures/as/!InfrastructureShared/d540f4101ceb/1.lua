-- Threat: !InfrastructureShared
-- Name: d540f4101ceb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
