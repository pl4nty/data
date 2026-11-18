-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Virus:Win32/Virut.BN
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.epscn_islast == false then
  return mp.CLEAN
end
local l_0_0 = mp.bitor(mp.bitor(mp.bitor(mp.bitor(mp.bitor(mp.bitor(mp.readu_u32(headerpage, 33), mp.readu_u32(headerpage, 37)), mp.readu_u32(headerpage, 41)), mp.readu_u32(headerpage, 45)), mp.readu_u32(headerpage, 49)), mp.readu_u32(headerpage, 53)), mp.readu_u32(headerpage, 57))
if l_0_0 == 0 then
  return mp.CLEAN
end
return mp.INFECTED
