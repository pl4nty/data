-- Threat: !InfrastructureShared
-- Name: 687890b5fee5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
