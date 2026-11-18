-- Threat: !InfrastructureShared
-- Name: 447899490a00
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
