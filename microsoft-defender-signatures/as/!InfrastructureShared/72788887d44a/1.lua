-- Threat: !InfrastructureShared
-- Name: 72788887d44a
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[3].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[4].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 400000 and hstrlog[1].matched and (hstrlog[2].matched or l_0_0 == 2) then
  return mp.INFECTED
end
return mp.CLEAN
