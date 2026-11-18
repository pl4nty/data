-- Threat: !InfrastructureShared
-- Name: !#Lua:ARM_LE
-- Type: 35
-- MpAttributes: BM_ELF_FILE

local l_0_0 = 40
local l_0_1 = 183
local l_0_2 = 1
local l_0_3 = elfhdr.ident
local l_0_4 = string.byte(l_0_3, 6)
if l_0_4 ~= l_0_2 or elfhdr.machine ~= l_0_0 and elfhdr.machine ~= l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
