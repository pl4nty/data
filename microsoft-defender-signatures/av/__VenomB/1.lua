-- Threat: \xd8\xa1Venom.B
-- Type: 35
-- MpAttributes: BM_ELF_EXEC_FILE & elfa_isstatic & elfa_hasnosectionsheader & RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
local l_0_1 = 500
local l_0_2 = 7
local l_0_3 = 40
local l_0_4 = 183
local l_0_5 = 1
local l_0_6 = 1
local l_0_7 = elfhdr.ident
local l_0_8 = string.byte(l_0_7, 6)
if l_0_8 ~= l_0_6 or elfhdr.machine ~= l_0_3 and elfhdr.machine ~= l_0_4 then
  return mp.CLEAN
end
if l_0_0 > l_0_1 then
  return mp.CLEAN
end
if elfhdr.phnum ~= 1 then
  return mp.CLEAN
end
local l_0_9 = ephdrs[1]
if l_0_9.type ~= l_0_5 or l_0_9.offset ~= 0 or l_0_9.flags ~= l_0_2 or l_0_9.align ~= 4096 then
  return mp.CLEAN
end
return mp.INFECTED
