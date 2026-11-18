-- Threat: !InfrastructureShared
-- Name: 977884a65afc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
