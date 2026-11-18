-- Threat: !InfrastructureShared
-- Name: e878ae0e6d67
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
