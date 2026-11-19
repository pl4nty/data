-- Threat: !InfrastructureShared
-- Name: c778315af8cf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
