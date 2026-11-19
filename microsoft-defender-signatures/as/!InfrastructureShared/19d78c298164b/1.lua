-- Threat: !InfrastructureShared
-- Name: 19d78c298164b
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 15000000 and (hstrlog[1].VA == 128 + pehdr.ImageBase or hstrlog[2].VA == 128 + pehdr.ImageBase or hstrlog[3].VA == 128 + pehdr.ImageBase or hstrlog[4].VA == 128 + pehdr.ImageBase) then
  return mp.INFECTED
end
return mp.CLEAN
