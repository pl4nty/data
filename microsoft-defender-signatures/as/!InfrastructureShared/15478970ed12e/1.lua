-- Threat: !InfrastructureShared
-- Name: 15478970ed12e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
