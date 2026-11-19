-- Threat: !InfrastructureShared
-- Name: a540f0268f34
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
