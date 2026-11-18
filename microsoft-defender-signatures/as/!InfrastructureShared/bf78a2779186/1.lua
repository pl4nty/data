-- Threat: !InfrastructureShared
-- Name: bf78a2779186
-- Type: 21

if epcode[1] == 233 and epcode[2] == 155 and epcode[3] == 219 and epcode[4] == 255 and pehdr.TimeDateStamp == 0 and pehdr.PointerToSymbolTable > 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
