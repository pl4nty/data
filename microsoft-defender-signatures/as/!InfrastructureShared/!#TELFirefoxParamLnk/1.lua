-- Threat: !InfrastructureShared
-- Name: !#TEL:FirefoxParamLnk
-- Type: 13
-- MpAttributes: BM_FirefoxParamLnk

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if string.sub(l_0_1, 1, 19) == "mozilla firefox.lnk" and (l_0_0:find("\\microsoft\\internet explorer\\quick launch", 1, true) ~= nil or string.sub(l_0_0, -20) == "\\start menu\\programs" or string.sub(l_0_0, -8) == "\\desktop") then
  return mp.INFECTED
end
return mp.CLEAN
