-- Threat: !InfrastructureShared
-- Name: 54788d7c0e32
-- Type: 21

if peattributes.isexe and pehdr.SizeOfImage >= 65536 and pehdr.SizeOfImage <= 98304 then
  return mp.INFECTED
end
return mp.CLEAN
