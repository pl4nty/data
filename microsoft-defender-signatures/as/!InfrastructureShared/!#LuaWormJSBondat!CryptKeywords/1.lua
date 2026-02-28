local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 92000 < L0_1 or L0_1 < 88000 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L2_1 = tostring
L3_1 = footerpage
L2_1 = L2_1(L3_1)
L1_1 = L1_1 .. L2_1
L3_1 = L1_1
L2_1 = L1_1.gmatch
L4_1 = "%[([^%[%]]*[%+\\][^%[%]]*)%]%("
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.char

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L3_1
  L2_2 = tonumber
  L3_2 = A0_2
  L4_2 = 16
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  return L1_2(L2_2, L3_2, L4_2)
end

function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L3_1
  L2_2 = tonumber
  L3_2 = A0_2
  L4_2 = 8
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  return L1_2(L2_2, L3_2, L4_2)
end

L6_1 = StrToBaseN
L7_1 = {}
L7_1.prototype = ""
L7_1.constructor = ""
L7_1.fromCharCode = ""
L7_1.parseInt = ""
L7_1.split = ""
L7_1.length = ""
L7_1.Function = ""
L8_1 = L2_1
L9_1 = nil
L10_1 = nil
for L11_1 in L8_1, L9_1, L10_1 do
  L13_1 = L11_1
  L12_1 = L11_1.gsub
  L14_1 = "\\x(..)"
  L15_1 = L4_1
  L12_1 = L12_1(L13_1, L14_1, L15_1)
  L13_1 = L12_1
  L12_1 = L12_1.gsub
  L14_1 = "%((%d+)%)%.toString%((%d+)%)"
  L15_1 = L6_1
  L12_1 = L12_1(L13_1, L14_1, L15_1)
  L13_1 = L12_1
  L12_1 = L12_1.gsub
  L14_1 = "([\"%+%s]+)"
  L15_1 = ""
  L12_1 = L12_1(L13_1, L14_1, L15_1)
  L13_1 = L12_1
  L12_1 = L12_1.gsub
  L14_1 = "\\(%d+)"
  L15_1 = L5_1
  L12_1 = L12_1(L13_1, L14_1, L15_1)
  L13_1 = L12_1
  L12_1 = L12_1.gsub
  L14_1 = "\\"
  L15_1 = ""
  L12_1 = L12_1(L13_1, L14_1, L15_1)
  L13_1 = L7_1[L12_1]
  if L13_1 then
    L13_1 = mp
    L13_1 = L13_1.INFECTED
    return L13_1
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
