-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000454_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["�\131"] = "a"
l_0_0["�\135"] = "b"
l_0_0["�\156"] = "c"
l_0_0["�\136"] = "d"
l_0_0["�\137"] = "e"
l_0_0["�\160"] = "f"
l_0_0["�\141"] = "g"
l_0_0["ʰ"] = "h"
l_0_0["�\177"] = "i"
l_0_0["ʲ"] = "j"
l_0_0["�\143"] = "k"
l_0_0["ˡ"] = "l"
l_0_0["�\144"] = "m"
l_0_0["�\191"] = "n"
l_0_0["�\146"] = "o"
l_0_0["�\150"] = "p"
l_0_0["ʳ"] = "r"
l_0_0["ˢ"] = "s"
l_0_0["�\151"] = "t"
l_0_0["�\152"] = "u"
l_0_0["�\155"] = "v"
l_0_0["ʷ"] = "w"
l_0_0["ˣ"] = "x"
l_0_0["ʸ"] = "y"
l_0_0["�\187"] = "z"
l_0_0["�\172"] = "A"
l_0_0["�\174"] = "B"
l_0_0["�\176"] = "D"
l_0_0["�\177"] = "E"
l_0_0["�\179"] = "G"
l_0_0["�\180"] = "H"
l_0_0["�\181"] = "I"
l_0_0["�\182"] = "J"
l_0_0["�\183"] = "K"
l_0_0["�\184"] = "L"
l_0_0["�\185"] = "M"
l_0_0["�\186"] = "N"
l_0_0["�\188"] = "O"
l_0_0["�\190"] = "P"
l_0_0["�\191"] = "R"
l_0_0["�\128"] = "T"
l_0_0["�\129"] = "U"
l_0_0["�\130"] = "W"
l_0_0["�\186"] = ""
l_0_0["�\145"] = ""
l_0_0["�\139"] = ""
l_0_0["�\188"] = ""
l_0_0["�\190"] = ""
l_0_0["�\172"] = ""
l_0_0["�\183"] = ""
l_0_0["�\154"] = ""
l_0_0["�\180"] = ""
l_0_0["�\186"] = ""
l_0_0["�\151"] = ""
l_0_0["�\153"] = ""
l_0_0["�\176"] = ""
l_0_0["�\160"] = ""
l_0_0["�\185"] = ""
l_0_0["�\167"] = ""
l_0_0["�\129"] = ""
local l_0_1 = {}
local l_0_2 = {}
-- DECOMPILER ERROR at PC68: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC71: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC76: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC82: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC89: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC92: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC95: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC96: Overwrote pending register: R2 in 'AssignReg'

if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = (string.lower)(l_0_3)
local l_0_5 = (MpCommon.GetImagePathFromPid)(l_0_2)
if not l_0_5 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC127: Overwrote pending register: R7 in 'AssignReg'

local l_0_6 = (string.lower)(("getconfig")(l_0_5, "([^\\]+)$"))
if not l_0_6 then
  return mp.CLEAN
end
if l_0_1[l_0_6] then
  local l_0_7 = l_0_1[l_0_6]
  local l_0_8 = replaceUnicodeWithAscii(l_0_3)
  if not l_0_8 then
    return mp.CLEAN
  end
  l_0_8 = (string.lower)(l_0_8)
  for l_0_12,l_0_13 in ipairs(l_0_7) do
    if (string.find)(l_0_8, l_0_13) and not (string.find)(l_0_4, l_0_13) then
      return mp.INFECTED
    end
  end
end
do
  l_0_7 = mp
  l_0_7 = l_0_7.CLEAN
  return l_0_7
end

