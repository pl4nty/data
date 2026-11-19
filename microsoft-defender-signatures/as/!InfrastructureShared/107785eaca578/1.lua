-- Threat: !InfrastructureShared
-- Name: 107785eaca578
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
