-- Threat: !InfrastructureShared
-- Name: 817814284234
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
