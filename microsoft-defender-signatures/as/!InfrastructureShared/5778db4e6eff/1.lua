-- Threat: !InfrastructureShared
-- Name: 5778db4e6eff
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
