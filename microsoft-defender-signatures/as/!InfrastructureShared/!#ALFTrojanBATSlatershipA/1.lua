-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanBATSlatershipA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "wintool.exe"
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_2 == nil then
  return mp.INFECTED
end
local l_0_3 = (MpCommon.PathToWin32Path)(l_0_1 .. "\\" .. l_0_2)
if l_0_3 == nil then
  return mp.INFECTED
end
do
  if (string.find)(l_0_2, ".exe->(rarsfx)->", 1, true) then
    local l_0_4 = (string.sub)(l_0_2, 1, (string.find)(l_0_2, "->", 1, true) - 1)
    if l_0_4 ~= l_0_0 then
      (mp.changedetectionname)(3902275675)
    end
  end
  return mp.INFECTED
end

