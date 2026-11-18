-- Threat: !InfrastructureShared
-- Name: !#Lua:EXEC_STACK
-- Type: 35
-- MpAttributes: (BM_ELF_EXEC_FILE | BM_ELF_DYN_FILE) & RPF:TopLevelFile

local l_0_0 = 1
local l_0_1 = 3
local l_0_2 = 62
local l_0_3 = 40
local l_0_4 = 183
local l_0_5 = 1
local l_0_6 = elfhdr.ident
local l_0_7 = string.byte(l_0_6, 6)
if l_0_7 ~= l_0_5 or elfhdr.machine ~= l_0_1 and elfhdr.machine ~= l_0_2 and elfhdr.machine ~= l_0_3 and elfhdr.machine ~= l_0_4 then
  return mp.CLEAN
end
local l_0_8 = 1685382481
for l_0_9 = 1, elfhdr.phnum do
  local l_0_10 = ephdrs[l_0_9]
  if l_0_10.type == l_0_8 and mp.bitand(l_0_10.flags, l_0_0) == l_0_0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
