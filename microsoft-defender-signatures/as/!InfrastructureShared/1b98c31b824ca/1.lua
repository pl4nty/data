-- Threat: !InfrastructureShared
-- Name: 1b98c31b824ca
-- Type: 21

if elfhdr.type ~= 2 and elfhdr.type ~= 3 then
  return mp.CLEAN
end
if elfhdr.phnum ~= 3 or elfhdr.shnum ~= 0 then
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
local l_0_5
if hstrlog[1] ~= nil and hstrlog[1].matched then
  l_0_5 = hstrlog[1].location
elseif hstrlog[2] ~= nil and hstrlog[2].matched then
  l_0_5 = hstrlog[2].location
elseif hstrlog[3] ~= nil and hstrlog[3].matched then
  l_0_5 = hstrlog[3].location
elseif hstrlog[4] ~= nil and hstrlog[4].matched then
  l_0_5 = hstrlog[4].location
elseif hstrlog[5] ~= nil and hstrlog[5].matched then
  l_0_5 = hstrlog[5].location
elseif hstrlog[6] ~= nil and hstrlog[6].matched then
  l_0_5 = hstrlog[6].location
elseif hstrlog[7] ~= nil and hstrlog[7].matched then
  l_0_5 = hstrlog[7].location
elseif hstrlog[8] ~= nil and hstrlog[8].matched then
  l_0_5 = hstrlog[8].location
elseif hstrlog[9] ~= nil and hstrlog[9].matched then
  l_0_5 = hstrlog[9].location
elseif hstrlog[10] ~= nil and hstrlog[10].matched then
  l_0_5 = hstrlog[10].location
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
