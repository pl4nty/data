local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 500000 or 30000000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.get_exports
L1_1, L2_1 = L1_1()
if L1_1 == nil or L1_1 < 10 or 300 < L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = {}

function L5_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L4_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = table
    L1_2 = L1_2.insert
    L2_2 = L3_1
    L3_2 = A0_2
    L1_2(L2_2, L3_2)
    L1_2 = L4_1
    L1_2[A0_2] = true
  end
end

addUniqueValue = L5_1
L5_1 = 1
L6_1 = L1_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = addUniqueValue
  L10_1 = L2_1[L8_1]
  L10_1 = L10_1.rva
  L9_1(L10_1)
end
L5_1 = #L3_1
L5_1 = L5_1 + 3
if L1_1 <= L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.lower
L6_1 = mp
L6_1 = L6_1.getfilename
L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L6_1()
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L6_1 = MpCommon
L6_1 = L6_1.ExpandEnvironmentVariables
L7_1 = "%windir%"
L6_1 = L6_1(L7_1)
if L6_1 ~= nil and L6_1 ~= "" then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L5_1
  L9_1 = string
  L9_1 = L9_1.lower
  L10_1 = L6_1
  L9_1 = L9_1(L10_1)
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 == nil then
    goto lbl_74
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_74::
L7_1 = MpCommon
L7_1 = L7_1.ExpandEnvironmentVariables
L8_1 = "%programfiles(x86)%"
L7_1 = L7_1(L8_1)
if L7_1 ~= nil and L7_1 ~= "" then
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L5_1
  L10_1 = string
  L10_1 = L10_1.lower
  L11_1 = L7_1
  L10_1 = L10_1(L11_1)
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 == nil then
    goto lbl_97
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_97::
L8_1 = MpCommon
L8_1 = L8_1.ExpandEnvironmentVariables
L9_1 = "%programfiles%"
L8_1 = L8_1(L9_1)
if L8_1 ~= nil and L8_1 ~= "" then
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L5_1
  L11_1 = string
  L11_1 = L11_1.lower
  L12_1 = L8_1
  L11_1 = L11_1(L12_1)
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 == nil then
    goto lbl_120
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
do return L9_1 end
::lbl_120::
L9_1 = #L3_1
if L9_1 == 1 then
  L9_1 = mp
  L9_1 = L9_1.set_mpattribute
  L10_1 = "Lua:AllExportsHasOneAddr"
  L9_1(L10_1)
else
  L9_1 = #L3_1
  if L9_1 == 2 then
    L9_1 = mp
    L9_1 = L9_1.set_mpattribute
    L10_1 = "Lua:ExportsHasTwoRVAOnly"
    L9_1(L10_1)
  else
    L9_1 = #L3_1
    L9_1 = L9_1 * 2
    if L1_1 > L9_1 then
      L9_1 = mp
      L9_1 = L9_1.set_mpattribute
      L10_1 = "Lua:MultiExportsShareRVA"
      L9_1(L10_1)
    else
      L9_1 = #L3_1
      L9_1 = L9_1 + 3
      if L1_1 > L9_1 then
        L9_1 = mp
        L9_1 = L9_1.set_mpattribute
        L10_1 = "Lua:FoundExportsShareRVA"
        L9_1(L10_1)
      end
    end
  end
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
