-- Threat: !InfrastructureShared
-- Name: 4f780305f9ba
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
