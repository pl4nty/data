-- Threat: !InfrastructureShared
-- Name: 2978263eb0fe
-- Type: 21
-- Flags: 1

local l_0_0 = 0
if hstrlog[1].matched then
  l_0_0 = l_0_0 + 1
end
if hstrlog[2].matched then
  l_0_0 = l_0_0 + 1
end
if mp.getfilesize() > 500000 and mp.getfilesize() < 1500000 and l_0_0 == 2 then
  return mp.INFECTED
end
return mp.CLEAN
