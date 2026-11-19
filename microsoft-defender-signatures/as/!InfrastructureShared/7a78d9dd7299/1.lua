-- Threat: !InfrastructureShared
-- Name: 7a78d9dd7299
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  return mp.INFECTED
end
local l_0_0 = 0
local l_0_1 = 0
if hstrlog[1].matched then
  l_0_1 = l_0_1 + 1
  if hstrlog[5].matched or hstrlog[6].matched or hstrlog[7].matched or hstrlog[8].matched then
    l_0_0 = l_0_0 + 1
  end
end
if hstrlog[2].matched then
  l_0_1 = l_0_1 + 1
  if hstrlog[9].matched or hstrlog[10].matched then
    l_0_0 = l_0_0 + 1
  end
end
if hstrlog[3].matched then
  l_0_1 = l_0_1 + 1
  if hstrlog[11].matched then
    l_0_0 = l_0_0 + 1
  end
end
if 2 <= l_0_0 then
  return mp.INFECTED
elseif hstrlog[4].matched and (l_0_1 == 3 or l_0_0 == 1) then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:VirTool:Win32/Obfuscator.AMO")
return mp.CLEAN
