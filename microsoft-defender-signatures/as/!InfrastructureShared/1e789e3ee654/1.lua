-- Threat: !InfrastructureShared
-- Name: 1e789e3ee654
-- Type: 21
-- Flags: 1

if hstrlog[1].VA == 0 + pehdr.ImageBase then
  return mp.INFECTED
end
return mp.CLEAN
