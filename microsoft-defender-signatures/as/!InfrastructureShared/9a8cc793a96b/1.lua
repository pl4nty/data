-- Threat: !InfrastructureShared
-- Name: 9a8cc793a96b
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
return mp.INFECTED
