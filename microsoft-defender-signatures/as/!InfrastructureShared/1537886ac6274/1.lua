-- Threat: !InfrastructureShared
-- Name: 1537886ac6274
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
