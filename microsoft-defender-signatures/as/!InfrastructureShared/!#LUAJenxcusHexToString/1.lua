local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "TARG:VBS/JenxcusHexToString"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = 1
else
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "TARG:VBS/JenxcusHexToString2"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = 2
  else
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "SCPT:VBS/JenxcusHexToString"
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L0_1 = 3
    else
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = tostring
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L4_1 = nil
L5_1 = nil
L6_1 = nil
if L0_1 == 1 then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = "= ?\"(.-)\""
  L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
  L5_1 = L9_1
  L4_1 = L8_1
  _ = L7_1
elseif L0_1 == 2 then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = "= ?\"(.-)\".-\"\".-\"\".-\"(.-)\""
  L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1, L9_1)
  L6_1 = L10_1
  L5_1 = L9_1
  L4_1 = L8_1
  _ = L7_1
elseif L0_1 == 3 then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L3_1
  L9_1 = "= ?\"((.)[0-9A-Za-z][0-9A-Za-z]?.[0-9A-Za-z][0-9A-Za-z]?.[0-9A-Za-z][0-9A-Za-z]?.+)\""
  L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1, L9_1)
  L6_1 = L10_1
  L5_1 = L9_1
  L4_1 = L8_1
  _ = L7_1
else
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = #L5_1
if L7_1 < 5000 then
  L4_1 = 1
  while true do
    L7_1 = string
    L7_1 = L7_1.len
    L8_1 = L5_1
    L7_1 = L7_1(L8_1)
    if not (L7_1 < 5000) then
      break
    end
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L3_1
    L9_1 = "\"(.-)\""
    L10_1 = L4_1 + 2
    L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1, L10_1)
    L5_1 = L9_1
    L4_1 = L8_1
    _ = L7_1
    if L5_1 == nil then
      break
    end
  end
end
L7_1 = #L5_1
if L7_1 < 5000 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = nil
L8_1 = nil
if L0_1 == 1 then
  L9_1 = fastHex2Bin
  L10_1 = L5_1
  L11_1 = "(..)"
  L9_1, L10_1 = L9_1(L10_1, L11_1)
  L8_1 = L10_1
  L7_1 = L9_1
else
  L10_1 = L5_1
  L9_1 = L5_1.gsub
  L11_1 = L6_1
  L12_1 = "(.)"
  L13_1 = L6_1
  L11_1 = L11_1 .. L12_1 .. L13_1
  L12_1 = L6_1
  L13_1 = "0%1"
  L14_1 = L6_1
  L12_1 = L12_1 .. L13_1 .. L14_1
  L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
  _ = L10_1
  L5_1 = L9_1
  L10_1 = L5_1
  L9_1 = L5_1.gsub
  L11_1 = L6_1
  L12_1 = "(.)"
  L13_1 = L6_1
  L11_1 = L11_1 .. L12_1 .. L13_1
  L12_1 = L6_1
  L13_1 = "0%1"
  L14_1 = L6_1
  L12_1 = L12_1 .. L13_1 .. L14_1
  L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1)
  _ = L10_1
  L5_1 = L9_1
  L9_1 = fastHex2Bin
  L10_1 = L5_1
  L11_1 = L6_1
  L12_1 = "(..)"
  L11_1 = L11_1 .. L12_1
  L9_1, L10_1 = L9_1(L10_1, L11_1)
  L8_1 = L10_1
  L7_1 = L9_1
end
L9_1 = mp
L9_1 = L9_1.vfo_add_buffer
L11_1 = L7_1
L10_1 = L7_1.sub
L12_1 = 1
L13_1 = L8_1
L10_1 = L10_1(L11_1, L12_1, L13_1)
L11_1 = "[JenxcusHexToStr]"
L12_1 = mp
L12_1 = L12_1.ADD_VFO_TAKE_ACTION_ON_DAD
L9_1(L10_1, L11_1, L12_1)
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
