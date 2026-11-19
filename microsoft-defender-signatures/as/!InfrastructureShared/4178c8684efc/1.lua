-- Threat: !InfrastructureShared
-- Name: 4178c8684efc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
