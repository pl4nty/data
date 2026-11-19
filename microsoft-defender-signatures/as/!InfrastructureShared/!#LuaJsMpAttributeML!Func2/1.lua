-- Threat: !InfrastructureShared
-- Name: !#Lua:JsMpAttributeML!Func2
-- Type: 13
-- Includes: PHelpers

local l_0_0 = mp.getfilesize()
if l_0_0 <= 1000 or 1000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
local l_0_3 = string.sub(l_0_2, -3)
local l_0_4 = string.sub(l_0_2, -4)
if l_0_3 ~= ".js" and l_0_4 ~= ".jse" then
  return mp.CLEAN
end
if true == IsInternetCache(l_0_1) or true == IsLowConfNPath(l_0_1) then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:JsLowfiFlag")
return mp.CLEAN
