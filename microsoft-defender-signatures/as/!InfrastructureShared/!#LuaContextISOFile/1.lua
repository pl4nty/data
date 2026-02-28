local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
L2_1 = 16777216
if L1_1 < 33792 or L1_1 > L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.bitand
L4_1 = L1_1
L5_1 = 2047
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILEPATH
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L4_1 = string
L4_1 = L4_1.lower
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_FILENAME
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L5_1(L6_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
L6_1 = L4_1
L5_1 = L4_1.len
L5_1 = L5_1(L6_1)
if L5_1 < 4 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.sub
L6_1 = L4_1
L7_1 = -4
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= ".iso" then
  L5_1 = string
  L5_1 = L5_1.sub
  L6_1 = L4_1
  L7_1 = -4
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 ~= ".img" then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = ""
L7_1 = L3_1
L6_1 = L3_1.find
L8_1 = "\\downloads"
L9_1 = 1
L10_1 = true
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
if L6_1 ~= nil then
  L5_1 = "Downloads"
else
  L7_1 = L3_1
  L6_1 = L3_1.find
  L8_1 = "\\temp\\temp[0-9]_.+%.zip$"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 ~= nil then
    L5_1 = "ZipTemp"
  else
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = false
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.readfile
L7_1 = 32768
L8_1 = 16
L6_1 = L6_1(L7_1, L8_1)
L8_1 = L6_1
L7_1 = L6_1.find
L9_1 = "\001CD001\001"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 == 1 then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:ContextISOFile"
  L9_1 = L5_1
  L8_1 = L8_1 .. L9_1
  L7_1(L8_1)
else
  L8_1 = L6_1
  L7_1 = L6_1.find
  L9_1 = "\000BEA01\001"
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 == 1 then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "Lua:ContextUDFFile"
    L9_1 = L5_1
    L8_1 = L8_1 .. L9_1
    L7_1(L8_1)
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
