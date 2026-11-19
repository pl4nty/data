-- Threat: !InfrastructureShared
-- Name: 587865d376a7
-- Type: 21

if epcode[1] == 139 and epcode[2] == 255 and epcode[3] == 200 and epcode[4] == 128 then
  return mp.INFECTED
end
return mp.CLEAN
