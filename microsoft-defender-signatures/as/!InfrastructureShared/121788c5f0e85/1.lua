-- Threat: !InfrastructureShared
-- Name: 121788c5f0e85
-- Type: 21

if (peattributes.x86_image == true or peattributes.amd64_image == true) and (peattributes.isdll == true or peattributes.isexe == true) then
  return mp.INFECTED
end
return mp.CLEAN
