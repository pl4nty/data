-- Threat: !InfrastructureShared
-- Name: b678e82dec51
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() < 40000 and hstrlog[1].matched or l_0_0 == 2 then
  return mp.INFECTED
end
return mp.CLEAN
