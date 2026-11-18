-- Threat: !InfrastructureShared
-- Name: 8b78863e3636
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
