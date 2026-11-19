-- Threat: !InfrastructureShared
-- Name: 197889ae0e0d
-- Type: 21

if hstrlog[1].VA > pehdr.ImageBase + pehdr.SizeOfHeaders then
  return mp.INFECTED
end
return mp.CLEAN
