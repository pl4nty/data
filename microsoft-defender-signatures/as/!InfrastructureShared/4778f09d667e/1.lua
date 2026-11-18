-- Threat: !InfrastructureShared
-- Name: 4778f09d667e
-- Type: 21
-- Flags: 1

if hstrlog[1].VA == 0 + pehdr.ImageBase + 4 or hstrlog[2].VA == 0 + pehdr.ImageBase + 4 then
  return mp.INFECTED
end
return mp.CLEAN
