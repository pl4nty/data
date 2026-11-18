-- Threat: !InfrastructureShared
-- Name: 20a78a8cde4c3
-- Type: 21

local l_0_0 = 0
if 0 < mp.bitand(mp.HSTR_WEIGHT, 240) then
  l_0_0 = 16
end
l_0_0 = l_0_0 + mp.bitand(mp.HSTR_WEIGHT, 15)
if 18 <= l_0_0 then
  return mp.INFECTED
elseif 2 <= l_0_0 then
  mp.set_mpattribute("HSTR:Rogue:Win32/Trapwot_Lowfi")
end
return mp.CLEAN
