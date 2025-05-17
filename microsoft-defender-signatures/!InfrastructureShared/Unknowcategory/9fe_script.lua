-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9fe_luac 

-- params : ...
-- function num : 0
if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
if ((pehdr.DataDirectory)[1]).Size == 0 then
  return mp.CLEAN
end
if peattributes.ismsil then
  return mp.CLEAN
end
if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.CLEAN
end
if (mp.get_mpattribute)("Win32/AutoIt") or (mp.get_mpattribute)("Win32/AutoIt_HSTR1") or (mp.get_mpattribute)("Win32/AutoIt_HSTR2") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("HSTR:Win32/DelphiFile") or (mp.get_mpattribute)("SIGATTR:DelphiFile") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("HSTR:NSIS.gen!A") or (mp.get_mpattribute)("HSTR:NSIS_Installer") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("ValidDigitalSignature") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("Lua:SenseIRCretaeFileinTemp") then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
  local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_2 = (string.lower)(l_0_2)
  if (string.find)(l_0_2, "\\windows\\temp\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = {}
  l_0_3[".exe"] = true
  l_0_3[".dll"] = true
  l_0_3[".cpl"] = true
  l_0_3[".ocx"] = true
  l_0_3[".pyd"] = true
  l_0_3[".pyc"] = true
  l_0_3[".tmp"] = true
  l_0_3[".zip"] = true
  l_0_3[".rar"] = true
  l_0_3[".dat"] = true
  if l_0_3[((string.lower)(l_0_1)):sub(-4)] then
    return mp.CLEAN
  end
  local l_0_4 = (mp.getfilesize)()
  if l_0_4 > 52428800 then
    return mp.CLEAN
  end
  if l_0_4 < 10485760 then
    return mp.CLEAN
  end
  local l_0_5 = pehdr.NumberOfSections
  local l_0_6 = (pesecs[1]).SizeOfRawData
  -- DECOMPILER ERROR at PC233: Unhandled construct in 'MakeBoolean' P1

  -- DECOMPILER ERROR at PC233: Unhandled construct in 'MakeBoolean' P1

  if peattributes.hasappendeddata and l_0_5 == 5 and l_0_6 <= 237568 and l_0_6 >= 36864 then
    local l_0_7 = (pesecs[l_0_5]).PointerToRawData + (pesecs[l_0_5]).SizeOfRawData
    local l_0_8 = l_0_4 - l_0_7
    if l_0_8 > 51380224 then
      return mp.CLEAN
    end
    if l_0_8 < 10485760 then
      return mp.CLEAN
    end
    ;
    (mp.readprotection)(false)
    local l_0_9 = (mp.readfile)(l_0_7, 16)
    if (string.find)(l_0_9, "%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]") then
      (mp.set_mpattribute)("Lua:DllGamObfusHugeOverlay")
    end
  end
end
do
  if l_0_5 == 3 then
    l_0_6 = (pesecs[2]).SizeOfRawData
    if l_0_6 <= 237568 and l_0_6 >= 36864 then
      local l_0_10 = (pesecs[l_0_5]).PointerToRawData + (pesecs[l_0_5]).SizeOfRawData
      local l_0_11 = l_0_4 - l_0_10
      if l_0_11 > 51380224 then
        return mp.CLEAN
      end
      if l_0_11 < 10485760 then
        return mp.CLEAN
      end
      ;
      (mp.readprotection)(false)
      local l_0_12 = (mp.readfile)(l_0_10, 16)
      if (string.find)(l_0_12, "%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]") then
        (mp.set_mpattribute)("//Lua:DllUpxHugeOverlay")
      end
    end
  end
  do
    if not peattributes.hasappendeddata and l_0_5 == 6 and l_0_6 <= 65536 and l_0_6 >= 24576 then
      local l_0_13 = (pesecs[l_0_5]).SizeOfRawData
      local l_0_14 = (pesecs[l_0_5]).PointerToRawData
      if l_0_13 > 51380224 then
        return mp.CLEAN
      end
      if l_0_13 < 10485760 then
        return mp.CLEAN
      end
      ;
      (mp.readprotection)(false)
      local l_0_15 = (mp.readfile)(l_0_14, 16)
      if (string.find)(l_0_15, "%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]") then
        (mp.set_mpattribute)("Lua:DllGamObfusHugeLastSection")
      end
    end
    do
      return mp.CLEAN
    end
  end
end

