-- Threat: !InfrastructureShared
-- Name: 408dfdfad508
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetCertificateInfo()
if 0 < #l_0_0 and l_0_0 ~= nil then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
if machoLC == nil or machoLC.__DATA == nil or machoLC.__DATA.__data == "" or machoLC.__DATA.__data == "" then
  return mp.CLEAN
end
local l_0_2 = machoLC.__DATA.__data.Size
local l_0_3 = machoLC.__DATA.__data.Offset
if l_0_2 == nil or l_0_3 == nil or l_0_2 == "" or l_0_3 == "" then
  return mp.CLEAN
end
if 64 <= l_0_2 then
  mp.readprotection(false)
  local l_0_4 = mp.readfile(l_0_3, 64)
  if (string.find(l_0_4, "\206\250\237\254", 1, true) or string.find(l_0_4, "\207\250\237\254", 1, true)) and string.find(l_0_4, "__TEXT", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
