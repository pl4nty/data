-- Threat: !InfrastructureShared
-- Name: 3578ed2973fd
-- Type: 21
-- Flags: 1

if hstrlog[3].matched and (hstrlog[1].matched or hstrlog[2].VA >= hstrlog[3].VA + pehdr.ImageBase and hstrlog[2].VA <= hstrlog[3].VA + 200 + pehdr.ImageBase) then
  return mp.INFECTED
end
return mp.CLEAN
