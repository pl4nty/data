local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 20) then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\240"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\226"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\239"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = {}
L2_1 = {}
L2_1.name = "Bold"
L2_1.upper_start = 119808
L2_1.lower_start = 119834
L3_1 = {}
L3_1.name = "Italic"
L3_1.upper_start = 119860
L3_1.lower_start = 119886
L4_1 = {}
L4_1.name = "BoldItalic"
L4_1.upper_start = 119912
L4_1.lower_start = 119938
L5_1 = {}
L5_1.name = "Script"
L5_1.upper_start = 119964
L5_1.lower_start = 119990
L6_1 = {}
L6_1.name = "ScriptBold"
L6_1.upper_start = 120016
L6_1.lower_start = 120042
L7_1 = {}
L7_1.name = "Fraktur"
L7_1.upper_start = 120068
L7_1.lower_start = 120094
L8_1 = {}
L8_1.name = "FrakturBold"
L8_1.upper_start = 120172
L8_1.lower_start = 120198
L9_1 = {}
L9_1.name = "DoubleStruck"
L9_1.upper_start = 120120
L9_1.lower_start = 120146
L10_1 = {}
L10_1.name = "SansSerif"
L10_1.upper_start = 120224
L10_1.lower_start = 120250
L11_1 = {}
L11_1.name = "SansSerifBold"
L11_1.upper_start = 120276
L11_1.lower_start = 120302
L12_1 = {}
L12_1.name = "SansSerifItalic"
L12_1.upper_start = 120328
L12_1.lower_start = 120354
L13_1 = {}
L13_1.name = "SansSerifBoldItalic"
L13_1.upper_start = 120380
L13_1.lower_start = 120406
L14_1 = {}
L14_1.name = "Monospace"
L14_1.upper_start = 120432
L14_1.lower_start = 120458
L15_1 = {}
L15_1.name = "SquaredLatin"
L15_1.upper_start = 127280
L15_1.lower_start = nil
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L1_1[11] = L12_1
L1_1[12] = L13_1
L1_1[13] = L14_1
L1_1[14] = L15_1
L2_1 = {}
L3_1 = {}
L3_1.name = "CircledLatin"
L3_1.upper_start = 9398
L3_1.lower_start = 9424
L4_1 = {}
L4_1.name = "FullwidthLatin"
L4_1.upper_start = 65313
L4_1.lower_start = 65345
L2_1[1] = L3_1
L2_1[2] = L4_1

function L3_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  L4_2 = A0_2 - 240
  L4_2 = L4_2 * 262144
  L5_2 = A1_2 - 128
  L5_2 = L5_2 * 4096
  L4_2 = L4_2 + L5_2
  L5_2 = A2_2 - 128
  L5_2 = L5_2 * 64
  L4_2 = L4_2 + L5_2
  L5_2 = A3_2 - 128
  L4_2 = L4_2 + L5_2
  return L4_2
end

function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = {}
  L1_2[120064] = "w"
  L1_2[120065] = "x"
  L1_2[120066] = "y"
  L1_2[120067] = "z"
  L2_2 = L1_2[A0_2]
  if L2_2 then
    L2_2 = "FrakturAltForm"
    L3_2 = L1_2[A0_2]
    return L2_2, L3_2
  end
  L2_2 = ipairs
  L3_2 = L1_1
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = L6_2.upper_start
    if L7_2 then
      L7_2 = L6_2.upper_start
      if A0_2 >= L7_2 then
        L7_2 = L6_2.upper_start
        L7_2 = L7_2 + 26
        if A0_2 < L7_2 then
          L7_2 = L6_2.name
          L8_2 = string
          L8_2 = L8_2.char
          L9_2 = L6_2.upper_start
          L9_2 = A0_2 - L9_2
          L10_2 = string
          L10_2 = L10_2.byte
          L11_2 = "A"
          L10_2 = L10_2(L11_2)
          L9_2 = L9_2 + L10_2
          L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
          return L7_2, L8_2, L9_2, L10_2, L11_2
      end
    end
    else
      L7_2 = L6_2.lower_start
      if L7_2 then
        L7_2 = L6_2.lower_start
        if A0_2 >= L7_2 then
          L7_2 = L6_2.lower_start
          L7_2 = L7_2 + 26
          if A0_2 < L7_2 then
            L7_2 = L6_2.name
            L8_2 = string
            L8_2 = L8_2.char
            L9_2 = L6_2.lower_start
            L9_2 = A0_2 - L9_2
            L10_2 = string
            L10_2 = L10_2.byte
            L11_2 = "a"
            L10_2 = L10_2(L11_2)
            L9_2 = L9_2 + L10_2
            L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
            return L7_2, L8_2, L9_2, L10_2, L11_2
          end
        end
      end
    end
  end
  L2_2 = ipairs
  L3_2 = L2_1
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = L6_2.upper_start
    if A0_2 >= L7_2 then
      L7_2 = L6_2.upper_start
      L7_2 = L7_2 + 26
      if A0_2 < L7_2 then
        L7_2 = L6_2.name
        L8_2 = string
        L8_2 = L8_2.char
        L9_2 = L6_2.upper_start
        L9_2 = A0_2 - L9_2
        L10_2 = string
        L10_2 = L10_2.byte
        L11_2 = "A"
        L10_2 = L10_2(L11_2)
        L9_2 = L9_2 + L10_2
        L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
        return L7_2, L8_2, L9_2, L10_2, L11_2
    end
    else
      L7_2 = L6_2.lower_start
      if A0_2 >= L7_2 then
        L7_2 = L6_2.lower_start
        L7_2 = L7_2 + 26
        if A0_2 < L7_2 then
          L7_2 = L6_2.name
          L8_2 = string
          L8_2 = L8_2.char
          L9_2 = L6_2.lower_start
          L9_2 = A0_2 - L9_2
          L10_2 = string
          L10_2 = L10_2.byte
          L11_2 = "a"
          L10_2 = L10_2(L11_2)
          L9_2 = L9_2 + L10_2
          L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
          return L7_2, L8_2, L9_2, L10_2, L11_2
        end
      end
    end
  end
  L2_2 = nil
  L3_2 = nil
  return L2_2, L3_2
end

L5_1 = {}
L6_1 = 0
L7_1 = {}
L8_1 = {}
L9_1 = {}
L10_1 = 1
while true do
  L11_1 = #L0_1
  if not (L10_1 <= L11_1) then
    break
  end
  L12_1 = L0_1
  L11_1 = L0_1.byte
  L13_1 = L10_1
  L11_1 = L11_1(L12_1, L13_1)
  if L11_1 == 226 or L11_1 == 239 then
    L12_1 = L10_1 + 2
    L13_1 = #L0_1
    if L12_1 <= L13_1 then
      L13_1 = L0_1
      L12_1 = L0_1.byte
      L14_1 = L10_1 + 1
      L15_1 = L10_1 + 2
      L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1)
      L14_1 = L11_1 % 16
      L14_1 = L14_1 * 4096
      L15_1 = L12_1 % 64
      L15_1 = L15_1 * 64
      L14_1 = L14_1 + L15_1
      L15_1 = L13_1 % 64
      L14_1 = L14_1 + L15_1
      L15_1 = L4_1
      L16_1 = L14_1
      L15_1, L16_1 = L15_1(L16_1)
      if L15_1 and L16_1 then
        L17_1 = L5_1[L15_1]
        if L17_1 == nil then
          L5_1[L15_1] = 0
        end
        L17_1 = L5_1[L15_1]
        L17_1 = L17_1 + 1
        L5_1[L15_1] = L17_1
        L8_1[L15_1] = true
        L6_1 = L6_1 + 1
        L17_1 = table
        L17_1 = L17_1.insert
        L18_1 = L7_1
        L19_1 = L16_1
        L17_1(L18_1, L19_1)
        L17_1 = table
        L17_1 = L17_1.insert
        L18_1 = L9_1
        L19_1 = L16_1
        L17_1(L18_1, L19_1)
      end
      L10_1 = L10_1 + 3
  end
  else
    if L11_1 == 240 then
      L12_1 = L10_1 + 3
      L13_1 = #L0_1
      if L12_1 <= L13_1 then
        L13_1 = L0_1
        L12_1 = L0_1.byte
        L14_1 = L10_1 + 1
        L15_1 = L10_1 + 3
        L12_1, L13_1, L14_1 = L12_1(L13_1, L14_1, L15_1)
        L15_1 = L3_1
        L16_1 = L11_1
        L17_1 = L12_1
        L18_1 = L13_1
        L19_1 = L14_1
        L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
        L16_1 = L4_1
        L17_1 = L15_1
        L16_1, L17_1 = L16_1(L17_1)
        if L16_1 and L17_1 then
          L18_1 = L5_1[L16_1]
          if L18_1 == nil then
            L5_1[L16_1] = 0
          end
          L18_1 = L5_1[L16_1]
          L18_1 = L18_1 + 1
          L5_1[L16_1] = L18_1
          L8_1[L16_1] = true
          L6_1 = L6_1 + 1
          L18_1 = table
          L18_1 = L18_1.insert
          L19_1 = L7_1
          L20_1 = L17_1
          L18_1(L19_1, L20_1)
          L18_1 = table
          L18_1 = L18_1.insert
          L19_1 = L9_1
          L20_1 = L17_1
          L18_1(L19_1, L20_1)
        end
        L10_1 = L10_1 + 4
    end
    else
      L13_1 = L0_1
      L12_1 = L0_1.sub
      L14_1 = L10_1
      L15_1 = L10_1
      L12_1 = L12_1(L13_1, L14_1, L15_1)
      L14_1 = L12_1
      L13_1 = L12_1.match
      L15_1 = "[%w]"
      L13_1 = L13_1(L14_1, L15_1)
      if L13_1 then
        L13_1 = table
        L13_1 = L13_1.insert
        L14_1 = L9_1
        L15_1 = L12_1
        L13_1(L14_1, L15_1)
      end
      L10_1 = L10_1 + 1
    end
  end
end
if 1 <= L6_1 then
  L11_1 = 0
  L12_1 = pairs
  L13_1 = L5_1
  L12_1, L13_1, L14_1 = L12_1(L13_1)
  for L15_1, L16_1 in L12_1, L13_1, L14_1 do
    if 0 < L16_1 then
      L11_1 = L11_1 + 1
      L17_1 = mp
      L17_1 = L17_1.set_mpattribute
      L18_1 = "Lua:FnameUnicodeStyleCharCount!"
      L19_1 = L15_1
      L20_1 = "!"
      L21_1 = tostring
      L22_1 = L16_1
      L21_1 = L21_1(L22_1)
      L18_1 = L18_1 .. L19_1 .. L20_1 .. L21_1
      L17_1(L18_1)
      if 4 <= L16_1 then
        L17_1 = mp
        L17_1 = L17_1.set_mpattribute
        L18_1 = "Lua:FnameUnicodeStyleChar!"
        L19_1 = L15_1
        L20_1 = "!GTE4"
        L18_1 = L18_1 .. L19_1 .. L20_1
        L17_1(L18_1)
      end
      if 8 <= L16_1 then
        L17_1 = mp
        L17_1 = L17_1.set_mpattribute
        L18_1 = "Lua:FnameUnicodeStyleChar!"
        L19_1 = L15_1
        L20_1 = "!GTE8"
        L18_1 = L18_1 .. L19_1 .. L20_1
        L17_1(L18_1)
      end
      if 15 <= L16_1 then
        L17_1 = mp
        L17_1 = L17_1.set_mpattribute
        L18_1 = "Lua:FnameUnicodeStyleChar!"
        L19_1 = L15_1
        L20_1 = "!GTE15"
        L18_1 = L18_1 .. L19_1 .. L20_1
        L17_1(L18_1)
      end
      if 20 <= L16_1 then
        L17_1 = mp
        L17_1 = L17_1.set_mpattribute
        L18_1 = "Lua:FnameUnicodeStyleChar!"
        L19_1 = L15_1
        L20_1 = "!GTE20"
        L18_1 = L18_1 .. L19_1 .. L20_1
        L17_1(L18_1)
      end
    end
  end
  if 1 <= L11_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "Lua:FnameNumberOfUnicodeStyles!"
    L14_1 = tostring
    L15_1 = L11_1
    L14_1 = L14_1(L15_1)
    L13_1 = L13_1 .. L14_1
    L12_1(L13_1)
  end
  if 4 <= L6_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "Lua:FnameUnicodeStyleCharTotalCountGTE4"
    L12_1(L13_1)
  end
  if 8 <= L6_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "Lua:FnameUnicodeStyleCharTotalCountGTE8"
    L12_1(L13_1)
  end
  if 15 <= L6_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "Lua:FnameUnicodeStyleCharTotalCountGTE15"
    L12_1(L13_1)
  end
  if 20 <= L6_1 then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "Lua:FnameUnicodeStyleCharTotalCountGTE20"
    L12_1(L13_1)
  end
  L12_1 = table
  L12_1 = L12_1.concat
  L13_1 = L7_1
  L12_1 = L12_1(L13_1)
  if L12_1 ~= nil then
    L13_1 = #L12_1
    if 4 <= L13_1 then
      L13_1 = string
      L13_1 = L13_1.lower
      L14_1 = L12_1
      L13_1 = L13_1(L14_1)
      L12_1 = L13_1
      L13_1 = mp
      L13_1 = L13_1.set_mpattribute
      L14_1 = "Lua:FnameUniStylePlain!"
      L15_1 = L12_1
      L14_1 = L14_1 .. L15_1
      L13_1(L14_1)
      L13_1 = string
      L13_1 = L13_1.find
      L14_1 = L12_1
      L15_1 = "code"
      L16_1 = 1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.set_mpattribute
        L14_1 = "Lua:FnameUniStylePlainHasString!code"
        L13_1(L14_1)
      end
      L13_1 = string
      L13_1 = L13_1.find
      L14_1 = L12_1
      L15_1 = "pass"
      L16_1 = 1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.set_mpattribute
        L14_1 = "Lua:FnameUniStylePlainHasString!pass"
        L13_1(L14_1)
      end
      L13_1 = string
      L13_1 = L13_1.find
      L14_1 = L12_1
      L15_1 = "password"
      L16_1 = 1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.set_mpattribute
        L14_1 = "Lua:FnameUniStylePlainHasString!password"
        L13_1(L14_1)
      end
      L13_1 = string
      L13_1 = L13_1.find
      L14_1 = L12_1
      L15_1 = "install"
      L16_1 = 1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.set_mpattribute
        L14_1 = "Lua:FnameUniStylePlainHasString!install"
        L13_1(L14_1)
      end
      L13_1 = string
      L13_1 = L13_1.find
      L14_1 = L12_1
      L15_1 = "setup"
      L16_1 = 1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.set_mpattribute
        L14_1 = "Lua:FnameUniStylePlainHasString!setup"
        L13_1(L14_1)
      end
      L13_1 = string
      L13_1 = L13_1.find
      L14_1 = L12_1
      L15_1 = "download"
      L16_1 = 1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.set_mpattribute
        L14_1 = "Lua:FnameUniStylePlainHasString!download"
        L13_1(L14_1)
      end
      L13_1 = string
      L13_1 = L13_1.find
      L14_1 = L12_1
      L15_1 = "update"
      L16_1 = 1
      L17_1 = true
      L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
      if L13_1 ~= nil then
        L13_1 = mp
        L13_1 = L13_1.set_mpattribute
        L14_1 = "Lua:FnameUniStylePlainHasString!update"
        L13_1(L14_1)
      end
    end
  end
  L13_1 = table
  L13_1 = L13_1.concat
  L14_1 = L9_1
  L13_1 = L13_1(L14_1)
  if L13_1 ~= nil then
    L14_1 = #L13_1
    if 4 <= L14_1 then
      L14_1 = string
      L14_1 = L14_1.lower
      L15_1 = L13_1
      L14_1 = L14_1(L15_1)
      L13_1 = L14_1
      L14_1 = mp
      L14_1 = L14_1.set_mpattribute
      L15_1 = "Lua:FnameUniStyleMix!"
      L16_1 = L13_1
      L15_1 = L15_1 .. L16_1
      L14_1(L15_1)
    end
  end
  L14_1 = mp
  L14_1 = L14_1.INFECTED
  return L14_1
end
L11_1 = mp
L11_1 = L11_1.CLEAN
return L11_1
