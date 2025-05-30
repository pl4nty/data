-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERTrojanWin64SplatLoaderGen!dha\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattributesubstring)("SplatLoader") then
  return mp.CLEAN
end
local l_0_0 = (MpCommon.PathToWin32Path)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if (string.find)(l_0_0, ":\\programdata\\usoshared\\", 1, true) == nil then
  return mp.CLEAN
end
if (pe.get_exports_count)() ~= 2 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (pe.get_exports)()
if l_0_2 == nil or l_0_1 ~= 2 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_3, l_0_4 = nil, nil
for l_0_8 = 1, l_0_1 do
  local l_0_9 = (pe.mmap_string_rva)((l_0_2[l_0_8]).namerva, 64)
  if l_0_9 ~= nil and (l_0_9:sub(-1) == "W" or l_0_9:sub(-1) == "w") then
    l_0_3 = l_0_9:lower()
  else
    if l_0_9 ~= nil then
      l_0_4 = l_0_9:lower()
    end
  end
end
do
  if l_0_3 == nil or l_0_4 == nil then
    return mp.CLEAN
  end
  if l_0_3 == l_0_4 .. "w" then
    return mp.INFECTED
  end
  return mp.CLEAN
end

