-- Threat: !InfrastructureShared
-- Name: c7786bc56f0c
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
