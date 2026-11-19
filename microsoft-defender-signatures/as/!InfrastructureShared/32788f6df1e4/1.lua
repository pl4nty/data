-- Threat: !InfrastructureShared
-- Name: 32788f6df1e4
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
