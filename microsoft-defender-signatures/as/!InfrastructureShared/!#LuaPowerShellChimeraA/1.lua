local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 4096 or 7340032 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.gsub
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L3_1 = " "
L4_1 = ""
L1_1 = L1_1(L2_1, L3_1, L4_1)
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "^#[A-Za-z%.]+"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.len
L3_1 = L3_1(L4_1)
if L3_1 < 40 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 0
L4_1 = 0
L5_1 = 0
L6_1 = 0
L7_1 = 0
L8_1 = nil
L10_1 = L1_1
L9_1 = L1_1.gmatch
L11_1 = [[
([^
]*)
?]]
L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
for L12_1 in L9_1, L10_1, L11_1 do
  L13_1 = string
  L13_1 = L13_1.match
  L14_1 = L12_1
  L15_1 = "^#[%a%d%.]+$"
  L13_1 = L13_1(L14_1, L15_1)
  L8_1 = L13_1
  if L8_1 then
    L14_1 = L8_1
    L13_1 = L8_1.len
    L13_1 = L13_1(L14_1)
    if 100 < L13_1 then
      L4_1 = L4_1 + 1
    else
      L14_1 = L8_1
      L13_1 = L8_1.len
      L13_1 = L13_1(L14_1)
      if 40 < L13_1 then
        L3_1 = L3_1 + 1
      end
    end
  else
    L13_1 = string
    L13_1 = L13_1.match
    L14_1 = L12_1
    L15_1 = "^%$[%a%d]+=\"[%a%d`%.]+\"$"
    L13_1 = L13_1(L14_1, L15_1)
    L8_1 = L13_1
    if L8_1 then
      L14_1 = L8_1
      L13_1 = L8_1.len
      L13_1 = L13_1(L14_1)
      if 18 <= L13_1 then
        L14_1 = L8_1
        L13_1 = L8_1.len
        L13_1 = L13_1(L14_1)
        if 80 < L13_1 then
          L6_1 = L6_1 + 1
        else
          L5_1 = L5_1 + 1
        end
    end
    else
      L13_1 = string
      L13_1 = L13_1.len
      L14_1 = L12_1
      L13_1 = L13_1(L14_1)
      if 3 < L13_1 then
        L13_1 = string
        L13_1 = L13_1.match
        L14_1 = L12_1
        L15_1 = "^%$%a+"
        L13_1 = L13_1(L14_1, L15_1)
        L8_1 = L13_1
        if L8_1 then
          L14_1 = L8_1
          L13_1 = L8_1.len
          L13_1 = L13_1(L14_1)
          if not (L13_1 < 20) then
            goto lbl_110
          end
        end
        L7_1 = L7_1 + 1
        if 10 <= L7_1 then
          L13_1 = mp
          L13_1 = L13_1.CLEAN
          return L13_1
        end
      end
    end
  end
  ::lbl_110::
end
L9_1 = false
if 2 <= L4_1 and 2 <= L6_1 or 2 <= L4_1 and 1 <= L6_1 and L7_1 <= 1 or 10 <= L3_1 and 5 <= L5_1 then
  L9_1 = true
end
if not L9_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = string
L10_1 = L10_1.gsub
L11_1 = tostring
L12_1 = footerpage
L11_1 = L11_1(L12_1)
L12_1 = " "
L13_1 = ""
L10_1 = L10_1(L11_1, L12_1, L13_1)
L11_1 = false
L12_1 = nil
L14_1 = L10_1
L13_1 = L10_1.gmatch
L15_1 = [[
([^
]*)
?]]
L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1)
for L16_1 in L13_1, L14_1, L15_1 do
  L17_1 = string
  L17_1 = L17_1.match
  L18_1 = L16_1
  L19_1 = "^#[%a%d%.]+$"
  L17_1 = L17_1(L18_1, L19_1)
  L12_1 = L17_1
  if L12_1 then
    L17_1 = string
    L17_1 = L17_1.len
    L18_1 = L12_1
    L17_1 = L17_1(L18_1)
    if 40 < L17_1 then
      L11_1 = true
      break
    end
  end
  L17_1 = string
  L17_1 = L17_1.match
  L18_1 = L16_1
  L19_1 = "[%w%+/]+"
  L17_1 = L17_1(L18_1, L19_1)
  L8_1 = L17_1
  if L8_1 then
    L17_1 = string
    L17_1 = L17_1.len
    L18_1 = L8_1
    L17_1 = L17_1(L18_1)
    if 18 < L17_1 then
      L11_1 = true
      break
    end
  end
end
if L11_1 then
  L13_1 = mp
  L13_1 = L13_1.INFECTED
  return L13_1
end
L13_1 = mp
L13_1 = L13_1.CLEAN
return L13_1
