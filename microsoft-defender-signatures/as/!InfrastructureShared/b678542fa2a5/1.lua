-- Threat: !InfrastructureShared
-- Name: b678542fa2a5
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
