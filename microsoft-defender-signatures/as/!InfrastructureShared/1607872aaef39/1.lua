-- Threat: !InfrastructureShared
-- Name: 1607872aaef39
-- Type: 21

if (hstrlog[1].matched or hstrlog[2].matched) and (hstrlog[3].matched or hstrlog[4].matched) then
  return mp.INFECTED
end
return mp.CLEAN
