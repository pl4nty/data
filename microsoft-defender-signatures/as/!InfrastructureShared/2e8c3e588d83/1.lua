-- Threat: !InfrastructureShared
-- Name: 2e8c3e588d83
-- Type: 21

if elfhdr.type ~= 2 and elfhdr.type ~= 3 then
  return mp.CLEAN
end
local l_0_0 = 1
local l_0_1 = 62
local l_0_2 = 3
local l_0_3 = elfhdr.ident
local l_0_4 = string.byte(l_0_3, 6)
if l_0_4 ~= l_0_0 or elfhdr.machine ~= l_0_1 and elfhdr.machine ~= l_0_2 then
  return mp.CLEAN
end
if not mp.get_mpattribute("elfa_isstatic") then
  return mp.CLEAN
end
local l_0_5
if hstrlog[1] ~= nil and hstrlog[1].matched and elfhdr.machine == l_0_1 then
  l_0_5 = hstrlog[1].location
end
if hstrlog[2] ~= nil and hstrlog[2].matched and elfhdr.machine == l_0_2 then
  l_0_5 = hstrlog[2].location
end
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6
for l_0_7 = 1, elfhdr.phnum do
  l_0_6 = ephdrs[l_0_7]
  if l_0_6 and l_0_6.type == 1 and elfhdr.entry > l_0_6.vaddr and elfhdr.entry < l_0_6.vaddr + l_0_6.memsz and l_0_6.vaddr + l_0_5 - l_0_6.offset == elfhdr.entry then
    return mp.INFECTED
  end
end
return mp.CLEAN
