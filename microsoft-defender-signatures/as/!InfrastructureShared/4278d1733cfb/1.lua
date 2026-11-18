-- Threat: !InfrastructureShared
-- Name: 4278d1733cfb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
