-- Threat: \xd8\xa1MalPack.B
-- Type: 35
-- MpAttributes: (HSTR:UPX_ELF_STRING | HSTR:UPX_ELF_CODE) & !elfa_ispacked & !HSTR:UPX_ELF_BITROCK

local l_0_0 = mp.getfilesize()
local l_0_1 = 8265
if l_0_0 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.BMSearchFile(l_0_0 - l_0_1, l_0_1, "UPX!\144\000")
if l_0_2 and l_0_2 ~= -1 then
  return mp.CLEAN
end
return mp.INFECTED
