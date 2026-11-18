-- Threat: !InfrastructureShared
-- Name: !#Lua:FileNameVulnerableToMagicDot.A
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & (!MpIsAMSIScan)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and l_0_0:sub(-1) == "." then
  return mp.INFECTED
end
return mp.CLEAN
