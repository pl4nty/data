-- Threat: !InfrastructureShared
-- Name: 57783507c580
-- Type: 21
-- Flags: 1

if hstrlog[1].VA == 0 + pehdr.ImageBase + 3 then
  return mp.INFECTED
end
return mp.CLEAN
