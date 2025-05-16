-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextPossibleXorPeFileInOverlayA\0x0000027d_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("Exception:PossibleXorPeFileInOverlay") == true then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("MpNewlyCreatedHint") and not (mp.get_mpattribute)("MpInternal_IsPliScan") and not (mp.get_mpattribute)("MpIsSENSEScan") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("CMN:HSTR:InstallerFile") == true or (mp.ispackedwith)("AutoIt+") == true or (mp.get_mpattributesubstring)("Win32/AutoIt") or (mp.get_mpattributesubstring)("PESTATIC:cleanstub_autoitv") or (mp.get_mpattribute)("Exception:FileOverlayAttributes") == true then
  return mp.CLEAN
end
if pehdr == nil or pehdr.ImageBase == nil then
  return mp.CLEAN
end
local l_0_0 = (pesecs[pehdr.NumberOfSections]).PointerToRawData + (pesecs[pehdr.NumberOfSections]).SizeOfRawData
local l_0_1 = (mp.getfilesize)()
if l_0_0 == nil or l_0_1 == nil or l_0_1 <= l_0_0 then
  return mp.CLEAN
end
local l_0_2 = l_0_1 - l_0_0
if l_0_2 < 5376 or l_0_2 > 10485760 then
  return mp.CLEAN
end
local l_0_3 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 == nil then
    return nil
  end
  for l_1_4 = 0, 255 do
    local l_1_5 = (string.char)((mp.bitxor)(105, l_1_4)) .. (string.char)((mp.bitxor)(110, l_1_4)) .. (string.char)((mp.bitxor)(32, l_1_4)) .. (string.char)((mp.bitxor)(68, l_1_4)) .. (string.char)((mp.bitxor)(79, l_1_4)) .. (string.char)((mp.bitxor)(83, l_1_4)) .. (string.char)((mp.bitxor)(32, l_1_4)) .. (string.char)((mp.bitxor)(109, l_1_4)) .. (string.char)((mp.bitxor)(111, l_1_4)) .. (string.char)((mp.bitxor)(100, l_1_4)) .. (string.char)((mp.bitxor)(101, l_1_4))
    local l_1_6 = (string.find)(l_1_0, l_1_5, 1, true)
    if l_1_6 ~= nil then
      local l_1_7 = (string.char)((mp.bitxor)(80, l_1_4)) .. (string.char)((mp.bitxor)(69, l_1_4))
      local l_1_8 = (string.find)(l_1_0, l_1_7, l_1_6, true)
      if l_1_8 ~= nil then
        local l_1_9 = (string.char)((mp.bitxor)(77, l_1_4)) .. (string.char)((mp.bitxor)(90, l_1_4))
        local l_1_10 = (string.find)(l_1_0, l_1_9, 1, true)
        if l_1_10 ~= nil and l_1_10 < l_1_6 then
          return l_1_4, l_1_10
        end
      end
    end
  end
  return nil
end

;
(mp.readprotection)(false)
local l_0_4 = (mp.readfile)(l_0_0, 1280)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_3(l_0_4)
if l_0_5 == nil then
  return mp.CLEAN
end
if l_0_5 == 0 then
  (mp.set_mpattribute)("Lua:Context/PeFileInOverlay.A")
else
  if l_0_5 >= 1 and l_0_5 <= 255 then
    local l_0_6 = (string.format)("0x%x", l_0_5)
    ;
    (mp.set_mpattribute)("Lua:Context/PossibleXorPeFileInOverlay.A!" .. tostring(l_0_6))
    ;
    (mp.set_mpattribute)("Lua:Context/PossibleXorEmbeddedFileInOverlay")
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

