-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:ExeHugeLastSection
-- Type: 10

if not peattributes.isexe then
  return mp.CLEAN
end
if peattributes.hasappendeddata then
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
local l_0_0 = mp.getfilesize()
if 209715200 < l_0_0 then
  return mp.CLEAN
end
if l_0_0 < 52428800 then
  return mp.CLEAN
end
local l_0_1 = pehdr.NumberOfSections
if 5 < l_0_1 then
  return mp.CLEAN
end
if l_0_1 < 3 then
  return mp.CLEAN
end
local l_0_2 = pesecs[1].SizeOfRawData
if l_0_2 <= 196608 and 36864 <= l_0_2 then
  local l_0_3 = pesecs[l_0_1].SizeOfRawData
  local l_0_4 = pesecs[l_0_1].PointerToRawData
  if 208666624 < l_0_3 then
    return mp.CLEAN
  end
  if l_0_3 < 51380224 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_5 = mp.readfile(l_0_4, 16)
  if string.find(l_0_5, "%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]%z[^%z][^%z][^%z]") then
    local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
    if l_0_6:sub(-4) ~= ".exe" then
      return mp.CLEAN
    end
    local l_0_7 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if (l_0_7:sub(-10) == "\\all users" or l_0_7:sub(-12) == "\\programdata" or l_0_7:sub(-17) == "\\application data" or l_0_7:sub(-16) == "\\appdata\\roaming") and (l_0_6:sub(1, 2) == "ms" or l_0_6:sub(1, 2) == "ob") then
      mp.set_mpattribute("Lua:ExeGamObfusHugeLastSection")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
