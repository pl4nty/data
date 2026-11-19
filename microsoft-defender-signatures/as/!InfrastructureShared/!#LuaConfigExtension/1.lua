-- Threat: !InfrastructureShared
-- Name: !#//Lua:ConfigExtension
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_XML_FILE

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if string.sub(l_0_0, -7) == ".config" then
  return mp.INFECTED
end
return mp.CLEAN
