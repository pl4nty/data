-- Threat: !InfrastructureShared
-- Name: 5f78b8893aa9
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
