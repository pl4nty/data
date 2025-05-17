-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextPossibleXorPeFileIn\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("HSTR:EmbeddedXorPeFileInResource.A") == true then
  return mp.INFECTED
end
if (mp.get_mpattribute)("Exception:PossibleXorPeFileInResource") == true then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("MpNewlyCreatedHint") and not (mp.get_mpattribute)("MpInternal_IsPliScan") and not (mp.get_mpattribute)("MpIsSENSEScan") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("CMN:HSTR:InstallerFile") == true or (mp.get_mpattribute)("Exception:FileResourceAttributes") == true then
  return mp.CLEAN
end
local l_0_0 = false
if (mp.get_mpattribute)("HSTR:EmbeddedXorPeFile.A") == true then
  l_0_0 = true
end
local l_0_1 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 == nil then
    return 
  end
  for l_1_4 = 1, pehdr.NumberOfSections do
    if tostring((pesecs[l_1_4]).Name) == l_1_0 then
      return (pesecs[l_1_4]).PointerToRawData, (pesecs[l_1_4]).SizeOfRawData
    end
  end
end

if pehdr == nil or pehdr.ImageBase == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = l_0_1(".rsrc")
if l_0_2 == nil or l_0_3 == nil or l_0_3 < 5376 then
  return mp.CLEAN
end
local l_0_4 = function(l_2_0, l_2_1)
  -- function num : 0_1
  if l_2_0 == nil then
    return nil
  end
  local l_2_2 = 0
  if l_2_1 ~= nil and l_2_1 == true then
    l_2_2 = 255
  end
  for l_2_6 = 0, l_2_2 do
    local l_2_7 = (string.char)((mp.bitxor)(105, l_2_6)) .. (string.char)((mp.bitxor)(110, l_2_6)) .. (string.char)((mp.bitxor)(32, l_2_6)) .. (string.char)((mp.bitxor)(68, l_2_6)) .. (string.char)((mp.bitxor)(79, l_2_6)) .. (string.char)((mp.bitxor)(83, l_2_6)) .. (string.char)((mp.bitxor)(32, l_2_6)) .. (string.char)((mp.bitxor)(109, l_2_6)) .. (string.char)((mp.bitxor)(111, l_2_6)) .. (string.char)((mp.bitxor)(100, l_2_6)) .. (string.char)((mp.bitxor)(101, l_2_6))
    local l_2_8 = (string.find)(l_2_0, l_2_7, 1, true)
    if l_2_8 ~= nil then
      local l_2_9 = (string.char)((mp.bitxor)(80, l_2_6)) .. (string.char)((mp.bitxor)(69, l_2_6))
      local l_2_10 = (string.find)(l_2_0, l_2_9, l_2_8, true)
      if l_2_10 ~= nil then
        local l_2_11 = (string.char)((mp.bitxor)(77, l_2_6)) .. (string.char)((mp.bitxor)(90, l_2_6))
        local l_2_12 = (string.find)(l_2_0, l_2_11, 1, true)
        if l_2_12 ~= nil and l_2_12 < l_2_8 then
          return l_2_6, l_2_12
        end
      end
    end
  end
  return nil
end

;
(mp.readprotection)(false)
local l_0_5 = (mp.readfile)(l_0_2, 1280)
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = l_0_4(l_0_5, l_0_0)
if l_0_6 == nil then
  return mp.CLEAN
end
if l_0_6 == 0 then
  (mp.set_mpattribute)("Lua:Context/PeFileInResource.A")
else
  if l_0_6 >= 1 and l_0_6 <= 255 then
    local l_0_7 = (string.format)("0x%x", l_0_6)
    ;
    (mp.set_mpattribute)("Lua:Context/PossibleXorPeFileInResource.A!" .. tostring(l_0_7))
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

