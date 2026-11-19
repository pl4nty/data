-- Threat: !InfrastructureShared
-- Name: 507898637b69
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
