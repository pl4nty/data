local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "SplatLoader"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L2_1(L3_1, L4_1)
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = ":\\programdata\\usoshared\\"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.get_exports_count
L1_1 = L1_1()
if L1_1 ~= 2 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.get_exports
L1_1, L2_1 = L1_1()
if L2_1 == nil or L1_1 ~= 2 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = nil
L4_1 = nil
L5_1 = 1
L6_1 = L1_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = pe
  L9_1 = L9_1.mmap_string_rva
  L10_1 = L2_1[L8_1]
  L10_1 = L10_1.namerva
  L11_1 = 64
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 ~= nil then
    L11_1 = L9_1
    L10_1 = L9_1.sub
    L12_1 = -1
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 ~= "W" then
      L11_1 = L9_1
      L10_1 = L9_1.sub
      L12_1 = -1
      L10_1 = L10_1(L11_1, L12_1)
      if L10_1 ~= "w" then
        goto lbl_89
      end
    end
    L11_1 = L9_1
    L10_1 = L9_1.lower
    L10_1 = L10_1(L11_1)
    L3_1 = L10_1
  else
    ::lbl_89::
    if L9_1 ~= nil then
      L11_1 = L9_1
      L10_1 = L9_1.lower
      L10_1 = L10_1(L11_1)
      L4_1 = L10_1
    end
  end
end
if L3_1 == nil or L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L4_1
L6_1 = "w"
L5_1 = L5_1 .. L6_1
if L3_1 == L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
