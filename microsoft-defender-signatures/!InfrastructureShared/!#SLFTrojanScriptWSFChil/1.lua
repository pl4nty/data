-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanScriptWSFChil\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.IOAVGetDownloadUrl)()
if l_0_0 and l_0_0:find("http:", 1, true) then
  local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1 then
    local l_0_2 = (MpCommon.PathToWin32Path)(l_0_1)
    if l_0_2 == nil then
      return mp.CLEAN
    end
    if l_0_2:match("%->.+/") or l_0_2:match("%->.+\\") or l_0_2:match("%->.+%->") then
      return mp.CLEAN
    end
    if l_0_2:find(".zip->", 1, true) or l_0_2:find(".rar->", 1, true) or l_0_2:find(".7z->", 1, true) or l_0_2:find(".tar.gz->", 1, true) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

