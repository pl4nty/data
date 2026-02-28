local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 1) then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = normalize_path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.gsub
L2_1 = L0_1
L3_1 = "\\"
L4_1 = ""
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1)
if L2_1 == nil or 18 <= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "Lua:LastFolder"
L4_1 = string
L4_1 = L4_1.format
L5_1 = "%sCount!%s"
L6_1 = L3_1
L7_1 = tostring
L8_1 = L2_1
L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L7_1(L8_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if L2_1 == 0 then
  L5_1 = #L0_1
  if L5_1 == 2 then
    L5_1 = string
    L5_1 = L5_1.sub
    L6_1 = L0_1
    L7_1 = -1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 == ":" then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = L3_1
      L7_1 = "0!"
      L8_1 = L0_1
      L6_1 = L6_1 .. L7_1 .. L8_1
      L5_1(L6_1)
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = L4_1
      L5_1(L6_1)
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
  end
end
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
L6_1 = false
L7_1 = L5_1
L8_1 = nil
L9_1 = nil
for L10_1 in L7_1, L8_1, L9_1 do
  if 0 <= L2_1 and L2_1 <= 5 then
    L11_1 = #L10_1
    if 1 <= L11_1 then
      L11_1 = string
      L11_1 = L11_1.format
      L12_1 = "%s%s!"
      L13_1 = L3_1
      L14_1 = tostring
      L15_1 = L2_1
      L14_1, L15_1, L16_1, L17_1 = L14_1(L15_1)
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
      if L11_1 ~= nil then
        L6_1 = true
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
      L12_1 = #L10_1
      if 1 < L12_1 then
        L13_1 = L10_1
        L12_1 = L10_1.sub
        L14_1 = -1
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 == "." then
          L12_1 = "Lua:FilePathVulnerableToMagicDot"
          L13_1 = mp
          L13_1 = L13_1.set_mpattribute
          L14_1 = L12_1
          L13_1(L14_1)
          L13_1 = string
          L13_1 = L13_1.format
          L14_1 = "%s!LastFolder%s"
          L15_1 = L12_1
          L16_1 = tostring
          L17_1 = L2_1
          L16_1, L17_1 = L16_1(L17_1)
          L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
          L14_1 = mp
          L14_1 = L14_1.set_mpattribute
          L15_1 = L13_1
          L14_1(L15_1)
        end
      end
    end
  end
  L2_1 = L2_1 - 1
  if L2_1 < 0 then
    break
  end
end
if L6_1 == true then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = L4_1
  L7_1(L8_1)
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
