-- Threat: !InfrastructureShared
-- Name: 6378b8069329
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
