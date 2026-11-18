-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Win32/ShadowLink.E!dha
-- Type: 24
-- MpAttributes: BM_TEXT_FILE

local l_0_0 = mp.enum_mpattributesubstring("HEUR:ShadowLink")
if 3 <= #l_0_0 then
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1 ~= nil and l_0_1:find("torrc", 1, true) == nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
