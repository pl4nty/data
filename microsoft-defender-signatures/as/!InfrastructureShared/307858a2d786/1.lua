-- Threat: !InfrastructureShared
-- Name: 307858a2d786
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
