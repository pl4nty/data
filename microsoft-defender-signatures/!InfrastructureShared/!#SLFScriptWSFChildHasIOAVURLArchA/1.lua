-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFScriptWSFChildHasIOAVURLArchA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
do
  if l_0_0 then
    local l_0_1 = (MpCommon.PathToWin32Path)(l_0_0)
    if l_0_1 == nil then
      return mp.CLEAN
    end
    if l_0_1:match("%->.+/") or l_0_1:match("%->.+\\") or l_0_1:match("%->.+%->") then
      return mp.CLEAN
    end
    if l_0_1:find(".zip->", 1, true) or l_0_1:find(".rar->", 1, true) or l_0_1:find(".7z->", 1, true) or l_0_1:find(".tar.gz->", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

