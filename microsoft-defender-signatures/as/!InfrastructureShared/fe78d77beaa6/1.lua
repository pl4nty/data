-- Threat: !InfrastructureShared
-- Name: fe78d77beaa6
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 3 and (hstrlog[5].matched or hstrlog[1].matched or hstrlog[2].matched) then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 2 then
  return mp.LOWFI
end
return mp.CLEAN
