-- Threat: !InfrastructureShared
-- Name: 7d780983e7e8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
