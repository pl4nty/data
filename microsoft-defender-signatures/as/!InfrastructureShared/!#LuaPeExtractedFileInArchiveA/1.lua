local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 22) then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\appdata\\local\\temp\\"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 ~= nil then
      goto lbl_29
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_29::
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "\\appdata\\local\\temp\\(.+)"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not (L2_1 < 4) then
    goto lbl_45
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_45::
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L2_1.zip = "temp%x_.+%.zip"
L2_1.rar = "rar$.+"
L2_1["7zip"] = "7z.+"
L2_1.wzip = "wz.+"
L3_1 = pairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = string
  L8_1 = L8_1.match
  L9_1 = L1_1
  L10_1 = L7_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 ~= nil then
    L8_1 = mp
    L8_1 = L8_1.set_mpattribute
    L9_1 = "Lua:PeExtractedFileInArchive.A!"
    L10_1 = L6_1
    L9_1 = L9_1 .. L10_1
    L8_1(L9_1)
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
