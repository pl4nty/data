-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Linux/UPXPackedLib
-- Type: 35
-- MpAttributes: (BM_ELF_EXEC_FILE | BM_ELF_DYN_FILE) & elfa_ispacked & RPF:TopLevelFile

local l_0_0 = 3
local l_0_1 = 62
local l_0_2 = 40
local l_0_3 = 183
local l_0_4 = 1
local l_0_5 = elfhdr.ident
local l_0_6 = string.byte(l_0_5, 6)
if l_0_6 ~= l_0_4 or elfhdr.machine ~= l_0_0 and elfhdr.machine ~= l_0_1 and elfhdr.machine ~= l_0_2 and elfhdr.machine ~= l_0_3 then
  return mp.CLEAN
end
local l_0_7 = 2
local l_0_8 = 3
local l_0_9 = false
for l_0_10 = 1, elfhdr.phnum do
  local l_0_11 = ephdrs[l_0_10]
  if l_0_11.type == l_0_8 then
    return mp.CLEAN
  elseif l_0_11.type == l_0_7 then
    l_0_9 = true
  end
end
if l_0_9 then
  return mp.INFECTED
end
return mp.CLEAN
