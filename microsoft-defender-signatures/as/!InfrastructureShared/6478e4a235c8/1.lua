-- Threat: !InfrastructureShared
-- Name: 6478e4a235c8
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
