-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\538d8484ed1a\0x0000c214_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 5 then
  return mp.CLEAN
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (machoLC.__TEXT).__cstring
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = ((machoLC.__TEXT).__cstring).Size
local l_0_3 = ((machoLC.__TEXT).__cstring).Offset
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
if l_0_2 >= 512 then
  (mp.readprotection)(false)
  local l_0_4 = (mp.readfile)(l_0_3, 512)
  if ((string.find)(l_0_4, "z/rt/g", 1, true) or (string.find)(l_0_4, "yv66vg", 1, true)) and (string.find)(l_0_4, "AAF9fVEVYVA", 1, true) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

