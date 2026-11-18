-- Threat: !InfrastructureShared
-- Name: 607809c16157
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
