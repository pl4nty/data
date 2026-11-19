-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:SuspToolsinSuspLoc.SA
-- Type: 24
-- Includes: BMLuaLib
-- MpAttributes: BM_MZ_FILE & RPF:TopLevelFile & !BM_HACKTOOL_DETECTION

if mp.get_mpattributesubstring("SLF:HackTool:") or mp.get_mpattributesubstring("SLF:VirTool:") or mp.get_mpattributesubstring("ALF:HackTool:") or mp.get_mpattributesubstring("ALF:VirTool:") then
  local l_0_0 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_0 == nil or #l_0_0 < 9 then
    return mp.CLEAN
  end
  local l_0_1 = l_0_0:match("(.+)\\[^\\]+$")
  l_0_1 = string.lower(l_0_1)
  local l_0_2 = {
    ":\\programdata$",
    ":\\perflogs$",
    ":\\users\\.*\\music$",
    ":windows\\temp$"
  }
  if contains(l_0_1, l_0_2, false) then
    return mp.INFECTED
  end
end
return mp.CLEAN
