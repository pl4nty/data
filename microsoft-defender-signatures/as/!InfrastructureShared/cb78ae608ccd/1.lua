-- Threat: !InfrastructureShared
-- Name: cb78ae608ccd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
