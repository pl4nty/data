-- Threat: !InfrastructureShared
-- Name: 9c78f4e164ce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
