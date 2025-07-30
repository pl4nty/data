-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\408dfdfad508\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetCertificateInfo)()
if #l_0_0 > 0 and l_0_0 ~= nil then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
if machoLC == nil or machoLC.__DATA == nil or (machoLC.__DATA).__data == "" or (machoLC.__DATA).__data == "" then
  return mp.CLEAN
end
local l_0_2 = ((machoLC.__DATA).__data).Size
local l_0_3 = ((machoLC.__DATA).__data).Offset
if l_0_2 == nil or l_0_3 == nil or l_0_2 == "" or l_0_3 == "" then
  return mp.CLEAN
end
if l_0_2 >= 64 then
  (mp.readprotection)(false)
  local l_0_4 = (mp.readfile)(l_0_3, 64)
  if ((string.find)(l_0_4, "Ξϊνώ", 1, true) or (string.find)(l_0_4, "Οϊνώ", 1, true)) and (string.find)(l_0_4, "__TEXT", 1, true) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

