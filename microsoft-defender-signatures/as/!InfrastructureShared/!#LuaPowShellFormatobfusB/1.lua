local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "psdeobfus-stg1"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "deobfus"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    goto lbl_150
  end
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "psdeobfus-stg2"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L2_2 = A0_2
  L1_2 = A0_2.gsub
  L3_2 = "[%(%)%.%%%+%-%*%?%[%]%^%$]"
  
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = "%"
    L2_3 = A0_3
    L1_3 = L1_3 .. L2_3
    return L1_3
  end
  
  return L1_2(L2_2, L3_2, L4_2)
end

escape_word = L1_1
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 200000 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 0
L4_1 = string
L4_1 = L4_1.gmatch
L5_1 = L2_1
L6_1 = "(\"{[%d{}]+}\")-f([\"%'](.-)[\"%'])[%)]"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = L7_1
  L10_1 = "-f"
  L11_1 = L8_1
  L9_1 = L9_1 .. L10_1 .. L11_1
  L10_1 = {}
  L11_1 = string
  L11_1 = L11_1.gmatch
  L12_1 = L7_1
  L13_1 = "%d+"
  L11_1, L12_1, L13_1 = L11_1(L12_1, L13_1)
  for L14_1 in L11_1, L12_1, L13_1 do
    L15_1 = table
    L15_1 = L15_1.insert
    L16_1 = L10_1
    L17_1 = tonumber
    L18_1 = L14_1
    L17_1 = L17_1(L18_1)
    L17_1 = L17_1 + 1
    L15_1(L16_1, L17_1)
  end
  L11_1 = {}
  L12_1 = string
  L12_1 = L12_1.gmatch
  L13_1 = L8_1
  L14_1 = "[\"%'](.-)[\"%']"
  L12_1, L13_1, L14_1 = L12_1(L13_1, L14_1)
  for L15_1 in L12_1, L13_1, L14_1 do
    L16_1 = table
    L16_1 = L16_1.insert
    L17_1 = L11_1
    L18_1 = L15_1
    L16_1(L17_1, L18_1)
  end
  L12_1 = #L11_1
  L13_1 = #L10_1
  if L12_1 == L13_1 then
    L12_1 = nil
    L13_1 = ipairs
    L14_1 = L10_1
    L13_1, L14_1, L15_1 = L13_1(L14_1)
    for L16_1, L17_1 in L13_1, L14_1, L15_1 do
      L18_1 = L11_1[L17_1]
      L19_1 = pcall
      L20_1 = string
      L20_1 = L20_1.gsub
      L21_1 = L7_1
      L22_1 = "{"
      L23_1 = L17_1 - 1
      L24_1 = "}"
      L22_1 = L22_1 .. L23_1 .. L24_1
      L23_1 = L18_1
      L19_1, L20_1 = L19_1(L20_1, L21_1, L22_1, L23_1)
      L7_1 = L20_1
      L12_1 = L19_1
    end
    if L12_1 then
      L3_1 = L3_1 + 1
      L13_1 = escape_word
      L14_1 = L9_1
      L13_1 = L13_1(L14_1)
      L9_1 = L13_1
      L13_1 = string
      L13_1 = L13_1.gsub
      L14_1 = L2_1
      L15_1 = L9_1
      L16_1 = L7_1
      L13_1 = L13_1(L14_1, L15_1, L16_1)
      L2_1 = L13_1
    end
  end
end
if 3 <= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.vfo_add_buffer
  L5_1 = L2_1
  L6_1 = "[psdeobfus-stg2]"
  L7_1 = mp
  L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_150::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
