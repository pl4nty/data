-- Threat: !InfrastructureShared
-- Name: 4a29302e3d76
-- Type: 21
-- Includes: ScriptLuaLib

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 10240 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = LoadMatchedDataInBuffer()
local l_0_2 = "curl[%w%s%-]+http:/-[%d]+%.[%d]+%.[%d]+%.[%d]+/[/%w%.%-_%s]+;%s*chmod%s0?7+%s[/%w%.%-_]+;%s*[/%w%s%.%-_]+;%s*rm%s+-?r?f?%s[/%w%.%-_]+"
if GetPatternOccurenceCount(l_0_1, l_0_2) > 5 then
  return mp.INFECTED
end
return mp.CLEAN
