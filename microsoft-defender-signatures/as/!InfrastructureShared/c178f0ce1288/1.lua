-- Threat: !InfrastructureShared
-- Name: c178f0ce1288
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
