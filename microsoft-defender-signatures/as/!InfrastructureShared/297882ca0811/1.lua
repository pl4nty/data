-- Threat: !InfrastructureShared
-- Name: 297882ca0811
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
