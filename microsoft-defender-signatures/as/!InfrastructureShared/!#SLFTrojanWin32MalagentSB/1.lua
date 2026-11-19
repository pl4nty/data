-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/Malagent.SB
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE & Lua:TopLevelUnsigned

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if not mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_1 == nil or l_0_0 == "" or l_0_1 == "" then
  return mp.CLEAN
end
if string.sub(l_0_0, 2) ~= ":\\programdata" then
  return mp.CLEAN
end
local l_0_2, l_0_3 = MpCommon.StringRegExpSearch("\\d{10,20}.exe", l_0_1)
if l_0_2 then
  if mp.IsTrustedFile(false) == true then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
