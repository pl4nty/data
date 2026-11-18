-- Threat: !InfrastructureShared
-- Name: 115409e159d70
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
