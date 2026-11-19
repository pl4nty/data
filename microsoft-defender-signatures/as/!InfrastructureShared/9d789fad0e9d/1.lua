-- Threat: !InfrastructureShared
-- Name: 9d789fad0e9d
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
