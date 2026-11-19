-- Threat: !InfrastructureShared
-- Name: 1978d71020af
-- Type: 21

if hstrlog[1].VA > pehdr.ImageBase + pehdr.SizeOfHeaders then
  return mp.INFECTED
end
return mp.CLEAN
