-- Threat: !InfrastructureShared
-- Name: !#TEL:LnkFileHasIOAVURL.B
-- Type: 13
-- MpAttributes: RPF:AnyFileHasIOAVURL & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:len() > 4 and string.sub(l_0_0, -4) == ".lnk" then
  return mp.INFECTED
end
return mp.CLEAN
