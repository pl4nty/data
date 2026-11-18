-- Threat: !InfrastructureShared
-- Name: 1dc78e132d665
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
