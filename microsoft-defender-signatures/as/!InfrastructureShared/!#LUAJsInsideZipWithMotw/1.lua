-- Threat: !InfrastructureShared
-- Name: !#LUA:JsInsideZipWithMotw
-- Type: 13
-- MpAttributes: Lua:JSExt & Nscript:Type_js

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:FileInZip", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = mp.UfsGetMetadataBool("Lua:ZipWithMotw", true)
if l_0_2 ~= 0 or not l_0_3 then
  return mp.CLEAN
end
return mp.INFECTED
