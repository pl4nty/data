-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/SoguJsps.B!dha
-- Type: 8
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE

local l_0_0 = mp.getfilesize()
if 1048576 < l_0_0 then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 10 then
  return mp.CLEAN
end
local l_0_1 = 77
for l_0_2 = 1, pehdr.NumberOfSections do
  if pesecs[l_0_2].Name == ".data" then
    local l_0_3 = pesecs[l_0_2].PointerToRawData
    local l_0_4 = pesecs[l_0_2].SizeOfRawData
    if l_0_3 ~= 0 and l_0_4 ~= 0 and l_0_0 >= l_0_3 + l_0_4 and l_0_1 <= l_0_4 then
      mp.readprotection(false)
      local l_0_5 = mp.readfile(l_0_3, l_0_1)
      mp.readprotection(true)
      local l_0_6 = mp.readu_u32(l_0_5, 1)
      local l_0_7 = mp.readu_u32(l_0_5, 64)
      local l_0_8 = mp.readu_u32(l_0_5, 73)
      if l_0_6 ~= 1000 and mp.bitxor(l_0_6, l_0_7) == 1000 and mp.bitxor(l_0_6, l_0_8) == 1000 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
