-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Script/WSFChildHasIOAVURLArch.B
-- Type: 13
-- MpAttributes: Lua:WSFExt

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 and l_0_0:find("http:", 1, true) then
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1 then
    local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
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
return mp.CLEAN
