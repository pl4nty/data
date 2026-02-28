local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = normalize_path
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_PATH
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L2_1(L3_1, L4_1)
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 1) then
    goto lbl_21
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_21::
L1_1 = string
L1_1 = L1_1.gsub
L2_1 = L0_1
L3_1 = "\\"
L4_1 = ""
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1)
if L2_1 == nil or L2_1 == 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "Lua:FirstFolder"
L4_1 = string
L4_1 = L4_1.format
L5_1 = "%sCount!%s"
L6_1 = L3_1
L7_1 = tostring
L8_1 = L2_1
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L7_1(L8_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
L5_1 = mp
L5_1 = L5_1.set_mpattribute
L6_1 = L4_1
L5_1(L6_1)
L6_1 = L0_1
L5_1 = L0_1.gsub
L7_1 = "%s"
L8_1 = "/x20"
L5_1 = L5_1(L6_1, L7_1, L8_1)
L0_1 = L5_1
L6_1 = L0_1
L5_1 = L0_1.gsub
L7_1 = "%("
L8_1 = "/x28"
L5_1 = L5_1(L6_1, L7_1, L8_1)
L0_1 = L5_1
L6_1 = L0_1
L5_1 = L0_1.gsub
L7_1 = "%)"
L8_1 = "/x29"
L5_1 = L5_1(L6_1, L7_1, L8_1)
L0_1 = L5_1
L5_1 = string
L5_1 = L5_1.gmatch
L6_1 = L0_1
L7_1 = "[^\\]+"
L5_1 = L5_1(L6_1, L7_1)
L6_1 = 0
L7_1 = L5_1
L8_1 = nil
L9_1 = nil
for L10_1 in L7_1, L8_1, L9_1 do
  L11_1 = #L10_1
  if 1 <= L11_1 and L6_1 <= 5 then
    L11_1 = string
    L11_1 = L11_1.format
    L12_1 = "%s%s!"
    L13_1 = L3_1
    L14_1 = tostring
    L15_1 = L6_1
    L14_1, L15_1, L16_1, L17_1 = L14_1(L15_1)
    L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
    if L11_1 ~= nil then
      L12_1 = L11_1
      L13_1 = L10_1
      L12_1 = L12_1 .. L13_1
      L13_1 = #L12_1
      if L13_1 <= 63 then
        L13_1 = mp
        L13_1 = L13_1.set_mpattribute
        L14_1 = L12_1
        L13_1(L14_1)
      else
        L13_1 = mp
        L13_1 = L13_1.set_mpattribute
        L15_1 = L12_1
        L14_1 = L12_1.sub
        L16_1 = 1
        L17_1 = 63
        L14_1, L15_1, L16_1, L17_1 = L14_1(L15_1, L16_1, L17_1)
        L13_1(L14_1, L15_1, L16_1, L17_1)
        L13_1 = mp
        L13_1 = L13_1.set_mpattribute
        L14_1 = L11_1
        L15_1 = ":longfolder"
        L14_1 = L14_1 .. L15_1
        L13_1(L14_1)
      end
    end
  end
  L6_1 = L6_1 + 1
  if 6 <= L6_1 then
    break
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
