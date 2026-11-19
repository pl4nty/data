-- Threat: !InfrastructureShared
-- Name: 82783082af57
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
