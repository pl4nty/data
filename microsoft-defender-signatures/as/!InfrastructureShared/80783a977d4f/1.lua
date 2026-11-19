-- Threat: !InfrastructureShared
-- Name: 80783a977d4f
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
