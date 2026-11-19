-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:SuspToolsinSuspLoc.SB
-- Type: 24
-- Includes: BMLuaLib
-- MpAttributes: BM_MZ_FILE & RPF:TopLevelFile & !BM_HACKTOOL_DETECTION

if mp.get_mpattributesubstring("BM_AT:") or mp.get_mpattributesubstring("BM_AT_cry:") then
  local l_0_0 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_0 == nil or #l_0_0 < 9 then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = {
    ":\\programdata$",
    ":\\perflogs$",
    ":\\users\\.*\\music$",
    ":windows\\temp$"
  }
  if contains(l_0_0, l_0_1, false) then
    return mp.INFECTED
  end
end
return mp.CLEAN
