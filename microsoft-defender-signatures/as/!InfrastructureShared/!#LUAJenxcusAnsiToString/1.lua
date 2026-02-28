local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "LUA:VBS/JenxcusAnsiToString1"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = 1
else
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "LUA:VBS/JenxcusAnsiToString2"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = 2
  else
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "LUA:VBS/JenxcusAnsiToString3"
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L0_1 = 3
    else
      L1_1 = mp
      L1_1 = L1_1.get_mpattribute
      L2_1 = "LUA:VBS/JenxcusAnsiToString4"
      L1_1 = L1_1(L2_1)
      if L1_1 then
        L0_1 = 4
      else
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
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
L3_1 = nil
L4_1 = nil
L5_1 = nil
if L0_1 == 1 then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L2_1
  L8_1 = "= ?%(?%(?\"(.-)\".-= ?%(?%(?\"(.-)\".+[Ss][Pp][Ll][Ii][Tt]%("
  L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
  L5_1 = L9_1
  L4_1 = L8_1
  L3_1 = L7_1
  L3_1 = L6_1
elseif L0_1 == 2 then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L2_1
  L8_1 = "= ?%(?%(?\"(.-)\".-[Ss][Pp][Ll][Ii][Tt].?%(.-\"(.-)\""
  L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
  L5_1 = L9_1
  L4_1 = L8_1
  L3_1 = L7_1
  L3_1 = L6_1
elseif L0_1 == 3 then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L2_1
  L8_1 = "= ?%(?%(?\"(.-)\".-[Ss][Pp][Ll][Ii][Tt]%(\"(.-)\""
  L6_1, L7_1, L8_1, L9_1 = L6_1(L7_1, L8_1)
  L4_1 = L9_1
  L5_1 = L8_1
  L3_1 = L7_1
  L3_1 = L6_1
elseif L0_1 == 4 then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L2_1
  L8_1 = "= ?%(?%(?(%(?[cC][hH][rR].+%)).-[eE][xX][eE][cC][uU][tT][eE]"
  L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
  L4_1 = L8_1
  L3_1 = L7_1
  L3_1 = L6_1
else
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = #L4_1
if L6_1 < 3000 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = nil
L7_1 = nil
if L0_1 == 4 then
  L8_1 = fastDec2Bin
  L9_1 = L4_1
  L10_1 = "%(?%(?[cC][hH][rR]%)?%)?%((%d-)%) ?&? ?"
  L8_1, L9_1 = L8_1(L9_1, L10_1)
  L7_1 = L9_1
  L6_1 = L8_1
else
  L8_1 = string
  L8_1 = L8_1.gsub
  L9_1 = L5_1
  L10_1 = "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])"
  L11_1 = "%%%1"
  L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1)
  L11_1 = L4_1
  L10_1 = L4_1.match
  L12_1 = "^%d-"
  L13_1 = L8_1
  L14_1 = "%d-"
  L15_1 = L8_1
  L16_1 = "%d-"
  L17_1 = L8_1
  L18_1 = "%d-"
  L19_1 = L8_1
  L20_1 = "%d-"
  L21_1 = L8_1
  L22_1 = "%d-"
  L12_1 = L12_1 .. L13_1 .. L14_1 .. L15_1 .. L16_1 .. L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1 .. L22_1
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 == nil then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
  L10_1 = fastDec2Bin
  L11_1 = L4_1
  L12_1 = "(%d-)"
  L13_1 = L8_1
  L12_1 = L12_1 .. L13_1
  L10_1, L11_1 = L10_1(L11_1, L12_1)
  L7_1 = L11_1
  L6_1 = L10_1
end
L8_1 = mp
L8_1 = L8_1.vfo_add_buffer
L10_1 = L6_1
L9_1 = L6_1.sub
L11_1 = 1
L12_1 = L7_1
L9_1 = L9_1(L10_1, L11_1, L12_1)
L10_1 = "[JenxcusToStr]"
L11_1 = mp
L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
