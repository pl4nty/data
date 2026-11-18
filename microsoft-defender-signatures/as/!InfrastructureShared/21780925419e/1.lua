-- Threat: !InfrastructureShared
-- Name: 21780925419e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
