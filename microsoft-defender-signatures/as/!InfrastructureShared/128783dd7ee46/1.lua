-- Threat: !InfrastructureShared
-- Name: 128783dd7ee46
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
