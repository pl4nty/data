-- Threat: !InfrastructureShared
-- Name: !#//LUA:NodeModulesPath
-- Type: 12
-- MpAttributes: BM_TEXT_FILE | Nscript:Type_js

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil then
  l_0_0 = string.gsub(l_0_0, "/", "\\")
  if string.find(l_0_0, "\\node_modules\\", 1, true) ~= nil then
    return mp.INFECTED
  end
end
mp.set_mpattribute("//LUA:NonNodeModulesPath")
return mp.CLEAN
