-- Threat: !InfrastructureShared
-- Name: !#SLF:Script/WSFChildHasIOAVURLArch.A
-- Type: 13
-- MpAttributes: RPF:WSFChildFileHasIOAVURL | RPF:WSFFileHasIOAVURL

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 then
  local l_0_1 = MpCommon.PathToWin32Path(l_0_0)
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
