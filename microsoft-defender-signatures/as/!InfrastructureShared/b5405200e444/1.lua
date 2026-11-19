-- Threat: !InfrastructureShared
-- Name: b5405200e444
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
