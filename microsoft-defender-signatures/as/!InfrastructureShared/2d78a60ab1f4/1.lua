-- Threat: !InfrastructureShared
-- Name: 2d78a60ab1f4
-- Type: 21
-- Flags: 1

if hstrlog[1].VA == 0 + pehdr.ImageBase then
  return mp.INFECTED
end
return mp.CLEAN
