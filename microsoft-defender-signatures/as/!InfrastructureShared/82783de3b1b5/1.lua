-- Threat: !InfrastructureShared
-- Name: 82783de3b1b5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
