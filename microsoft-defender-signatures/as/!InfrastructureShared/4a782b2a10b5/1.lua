-- Threat: !InfrastructureShared
-- Name: 4a782b2a10b5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
