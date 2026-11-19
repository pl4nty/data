-- Threat: !InfrastructureShared
-- Name: !#Lua:DllHugeFooter
-- Type: 10

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].Size == 0 then
  return mp.CLEAN
end
if peattributes.ismsil then
  return mp.CLEAN
end
if peattributes.isvbnative or peattributes.isvbpcode then
  return mp.CLEAN
end
if mp.get_mpattribute("Win32/AutoIt") or mp.get_mpattribute("Win32/AutoIt_HSTR1") or mp.get_mpattribute("Win32/AutoIt_HSTR2") then
  return mp.CLEAN
end
if mp.get_mpattribute("HSTR:Win32/DelphiFile") or mp.get_mpattribute("SIGATTR:DelphiFile") then
  return mp.CLEAN
end
if mp.get_mpattribute("HSTR:NSIS.gen!A") or mp.get_mpattribute("HSTR:NSIS_Installer") then
  return mp.CLEAN
end
if mp.get_mpattribute("ValidDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:SenseIRCretaeFileinTemp") then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_2 = MpCommon.PathToWin32Path(l_0_2)
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, "\\windows\\temp\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = {
    [".exe"] = true,
    [".dll"] = true,
    [".cpl"] = true,
    [".ocx"] = true,
    [".pyd"] = true,
    [".pyc"] = true,
    [".tmp"] = true,
    [".zip"] = true,
    [".rar"] = true,
    [".dat"] = true
  }
  if l_0_3[string.lower(l_0_1):sub(-4)] then
    return mp.CLEAN
  end
  local l_0_4 = mp.getfilesize()
  if 52428800 < l_0_4 then
    return mp.CLEAN
  end
  if l_0_4 < 10485760 then
    return mp.CLEAN
  end
  local l_0_5 = pehdr.NumberOfSections
  local l_0_6 = pesecs[1].SizeOfRawData
  if peattributes.hasappendeddata then
    if l_0_5 == 5 then
      if l_0_6 <= 237568 and 36864 <= l_0_6 then
        local l_0_7 = pesecs[l_0_5].PointerToRawData + pesecs[l_0_5].SizeOfRawData
        local l_0_8 = l_0_4 - l_0_7
        if 51380224 < l_0_8 then
          return mp.CLEAN
        end
        if l_0_8 < 10485760 then
          return mp.CLEAN
        end
        mp.readprotection(false)
        local l_0_9 = mp.readfile(l_0_7, 16)
        if string.find(l_0_9, "%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]") then
          mp.set_mpattribute("Lua:DllGamObfusHugeOverlay")
        end
      end
    elseif l_0_5 == 3 then
      l_0_6 = pesecs[2].SizeOfRawData
      if l_0_6 <= 237568 and 36864 <= l_0_6 then
        local l_0_10 = pesecs[l_0_5].PointerToRawData + pesecs[l_0_5].SizeOfRawData
        local l_0_11 = l_0_4 - l_0_10
        if 51380224 < l_0_11 then
          return mp.CLEAN
        end
        if l_0_11 < 10485760 then
          return mp.CLEAN
        end
        mp.readprotection(false)
        local l_0_12 = mp.readfile(l_0_10, 16)
        if string.find(l_0_12, "%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]") then
          mp.set_mpattribute("//Lua:DllUpxHugeOverlay")
        end
      end
    end
  elseif not peattributes.hasappendeddata and l_0_5 == 6 and l_0_6 <= 65536 and 24576 <= l_0_6 then
    local l_0_13 = pesecs[l_0_5].SizeOfRawData
    local l_0_14 = pesecs[l_0_5].PointerToRawData
    if 51380224 < l_0_13 then
      return mp.CLEAN
    end
    if l_0_13 < 10485760 then
      return mp.CLEAN
    end
    mp.readprotection(false)
    local l_0_15 = mp.readfile(l_0_14, 16)
    if string.find(l_0_15, "%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]") then
      mp.set_mpattribute("Lua:DllGamObfusHugeLastSection")
    end
  end
end
return mp.CLEAN
