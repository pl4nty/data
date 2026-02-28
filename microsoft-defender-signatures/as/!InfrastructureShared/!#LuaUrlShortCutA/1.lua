local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 256 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = tostring
L2_1 = headerpage
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = #L0_1
L1_1 = L1_1 - 1
L2_1 = 1
L3_1 = -1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = mp
  L5_1 = L5_1.readu_u16
  L6_1 = L0_1
  L7_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 == 2573 then
    L5_1 = mp
    L5_1 = L5_1.vfo_add_buffer
    L7_1 = L0_1
    L6_1 = L0_1.sub
    L8_1 = 1
    L9_1 = L4_1
    L6_1 = L6_1(L7_1, L8_1, L9_1)
    L7_1 = "[InternetShortcut_FILEDATA]"
    L8_1 = mp
    L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = #L0_1
    L5_1 = L5_1 - L4_1
    if 48 < L5_1 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:InternetShortcutHasAppendedData"
      L5_1(L6_1)
    end
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
