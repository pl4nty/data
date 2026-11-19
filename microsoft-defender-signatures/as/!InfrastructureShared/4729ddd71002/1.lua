-- Threat: !InfrastructureShared
-- Name: 4729ddd71002
-- Type: 21
-- Includes: ScriptLuaLib

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 10240 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = LoadMatchedDataInBuffer()
local l_0_2 = "curl[%w%s%-]+http://[%d]+%.[%d]+%.[%d]+%.[%d]+/[/%w%.%-_]+;%schmod%s%+x%s[/%w%.%-_]+;%s+[/%w%s%.%-_]+;%srm%s%-rf?%s[/%w%.%-_]+"
if GetPatternOccurenceCount(l_0_1, l_0_2) > 5 then
  return mp.INFECTED
end
return mp.CLEAN
