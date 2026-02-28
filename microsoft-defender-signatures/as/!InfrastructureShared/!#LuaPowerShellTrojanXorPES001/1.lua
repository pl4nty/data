local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 4096 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = tostring
L2_1 = mp
L2_1 = L2_1.readfooter
L3_1 = 0
L4_1 = 4096
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "bxor"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readheader
L3_1 = 0
L4_1 = 4096
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.gmatch
L4_1 = L1_1
L5_1 = "bxor%s+(0x%x%x)"
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
for L6_1 in L3_1, L4_1, L5_1 do
  if L6_1 ~= nil and L6_1 ~= "" then
    L7_1 = ""
    L8_1 = ""
    L9_1 = string
    L9_1 = L9_1.gmatch
    L10_1 = L2_1
    L11_1 = "([A-Za-z0-9+/=]+)"
    L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
    for L12_1 in L9_1, L10_1, L11_1 do
      if L12_1 ~= nil then
        L13_1 = string
        L13_1 = L13_1.len
        L14_1 = L12_1
        L13_1 = L13_1(L14_1)
        if 100 < L13_1 then
          L13_1 = MpCommon
          L13_1 = L13_1.Base64Decode
          L14_1 = L12_1
          L13_1 = L13_1(L14_1)
          L7_1 = L13_1
          if L7_1 ~= nil and L7_1 ~= "" then
            L14_1 = L7_1
            L13_1 = L7_1.gmatch
            L15_1 = "."
            L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1)
            for L16_1 in L13_1, L14_1, L15_1 do
              L17_1 = L8_1
              L18_1 = mp
              L18_1 = L18_1.bitxor
              L19_1 = string
              L19_1 = L19_1.byte
              L20_1 = L16_1
              L19_1 = L19_1(L20_1)
              L20_1 = L6_1
              L18_1 = L18_1(L19_1, L20_1)
              L8_1 = L17_1 .. L18_1
            end
          end
        end
      end
    end
    if L8_1 ~= nil and L8_1 ~= "" then
      L9_1 = string
      L9_1 = L9_1.match
      L10_1 = L8_1
      L11_1 = "^77902320000"
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 ~= nil and L9_1 ~= "" then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:ShellBytesXorInB64.S001"
        L10_1(L11_1)
      end
    end
    L9_1 = ""
    L10_1 = string
    L10_1 = L10_1.gmatch
    L11_1 = L2_1
    L12_1 = "%((%d+,%d+,%d+,%d+,%d+,%d+,%d+,[%d,]+)"
    L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1)
    for L13_1 in L10_1, L11_1, L12_1 do
      if L13_1 ~= nil then
        L14_1 = string
        L14_1 = L14_1.len
        L15_1 = L13_1
        L14_1 = L14_1(L15_1)
        if 100 < L14_1 then
          L15_1 = L13_1
          L14_1 = L13_1.gmatch
          L16_1 = "%d+"
          L14_1, L15_1, L16_1 = L14_1(L15_1, L16_1)
          for L17_1 in L14_1, L15_1, L16_1 do
            L18_1 = L9_1
            L19_1 = string
            L19_1 = L19_1.char
            L20_1 = mp
            L20_1 = L20_1.bitxor
            L21_1 = L17_1
            L22_1 = L6_1
            L20_1, L21_1, L22_1 = L20_1(L21_1, L22_1)
            L19_1 = L19_1(L20_1, L21_1, L22_1)
            L9_1 = L18_1 .. L19_1
          end
        end
      end
    end
    if L9_1 ~= nil and L9_1 ~= "" then
      L10_1 = ""
      L11_1 = ""
      L12_1 = string
      L12_1 = L12_1.find
      L13_1 = L9_1
      L14_1 = "MZ"
      L15_1 = 1
      L16_1 = true
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      if L12_1 ~= nil then
        L10_1 = "Found"
      end
      L12_1 = string
      L12_1 = L12_1.find
      L13_1 = L9_1
      L14_1 = "This program cannot be run"
      L15_1 = 1
      L16_1 = true
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      if L12_1 ~= nil then
        L11_1 = "Found"
      end
      if L10_1 ~= nil and L11_1 ~= nil and L10_1 ~= "" and L11_1 ~= "" then
        L12_1 = mp
        L12_1 = L12_1.set_mpattribute
        L13_1 = "Lua:PEembedViaXOR.S002"
        L12_1(L13_1)
      end
    end
  end
end
L3_1 = string
L3_1 = L3_1.gmatch
L4_1 = L1_1
L5_1 = "bxor%s+(%d?%d%d?)"
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
for L6_1 in L3_1, L4_1, L5_1 do
  if L6_1 ~= nil and L6_1 ~= "" then
    L7_1 = ""
    L8_1 = ""
    L9_1 = string
    L9_1 = L9_1.gmatch
    L10_1 = L2_1
    L11_1 = "([A-Za-z0-9+/=]+)"
    L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
    for L12_1 in L9_1, L10_1, L11_1 do
      if L12_1 ~= nil then
        L13_1 = string
        L13_1 = L13_1.len
        L14_1 = L12_1
        L13_1 = L13_1(L14_1)
        if 100 < L13_1 then
          L13_1 = MpCommon
          L13_1 = L13_1.Base64Decode
          L14_1 = L12_1
          L13_1 = L13_1(L14_1)
          L7_1 = L13_1
          if L7_1 ~= nil and L7_1 ~= "" then
            L14_1 = L7_1
            L13_1 = L7_1.gmatch
            L15_1 = "."
            L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1)
            for L16_1 in L13_1, L14_1, L15_1 do
              L17_1 = L8_1
              L18_1 = mp
              L18_1 = L18_1.bitxor
              L19_1 = string
              L19_1 = L19_1.byte
              L20_1 = L16_1
              L19_1 = L19_1(L20_1)
              L20_1 = L6_1
              L18_1 = L18_1(L19_1, L20_1)
              L8_1 = L17_1 .. L18_1
            end
          end
        end
      end
    end
    if L8_1 ~= nil and L8_1 ~= "" then
      L9_1 = string
      L9_1 = L9_1.match
      L10_1 = L8_1
      L11_1 = "^77902320000"
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 ~= nil and L9_1 ~= "" then
        L10_1 = mp
        L10_1 = L10_1.set_mpattribute
        L11_1 = "Lua:ShellBytesXorInB64.S001"
        L10_1(L11_1)
      end
    end
    L9_1 = ""
    L10_1 = string
    L10_1 = L10_1.gmatch
    L11_1 = L2_1
    L12_1 = "%((%d+,%d+,%d+,%d+,%d+,%d+,%d+,[%d,]+)"
    L10_1, L11_1, L12_1 = L10_1(L11_1, L12_1)
    for L13_1 in L10_1, L11_1, L12_1 do
      if L13_1 ~= nil then
        L14_1 = string
        L14_1 = L14_1.len
        L15_1 = L13_1
        L14_1 = L14_1(L15_1)
        if 100 < L14_1 then
          L15_1 = L13_1
          L14_1 = L13_1.gmatch
          L16_1 = "(%d+),"
          L14_1, L15_1, L16_1 = L14_1(L15_1, L16_1)
          for L17_1 in L14_1, L15_1, L16_1 do
            L18_1 = L9_1
            L19_1 = string
            L19_1 = L19_1.char
            L20_1 = mp
            L20_1 = L20_1.bitxor
            L21_1 = L17_1
            L22_1 = L6_1
            L20_1, L21_1, L22_1 = L20_1(L21_1, L22_1)
            L19_1 = L19_1(L20_1, L21_1, L22_1)
            L9_1 = L18_1 .. L19_1
          end
        end
      end
    end
    if L9_1 ~= nil and L9_1 ~= "" then
      L10_1 = ""
      L11_1 = ""
      L12_1 = string
      L12_1 = L12_1.find
      L13_1 = L9_1
      L14_1 = "MZ"
      L15_1 = 1
      L16_1 = true
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      if L12_1 ~= nil then
        L10_1 = "Found"
      end
      L12_1 = string
      L12_1 = L12_1.find
      L13_1 = L9_1
      L14_1 = "This program cannot be run"
      L15_1 = 1
      L16_1 = true
      L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
      if L12_1 ~= nil then
        L11_1 = "Found"
      end
      if L10_1 ~= nil and L11_1 ~= nil and L10_1 ~= "" and L11_1 ~= "" then
        L12_1 = mp
        L12_1 = L12_1.set_mpattribute
        L13_1 = "Lua:PEembedViaXOR.S002"
        L12_1(L13_1)
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
