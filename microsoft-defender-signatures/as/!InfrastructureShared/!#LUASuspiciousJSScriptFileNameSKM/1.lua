-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousJSScriptFileNameSKM
-- Type: 13
-- MpAttributes: (Lua:JSExt) | (Nscript:Type_js)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "fattura%d%d%d%d%d%d%d%d%.js") ~= nil or string.find(l_0_0, "invoice%-%d%d%d+%.pdf %(%d+%)%.js") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
