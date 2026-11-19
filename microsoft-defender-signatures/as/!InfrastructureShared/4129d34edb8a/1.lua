-- Threat: !InfrastructureShared
-- Name: 4129d34edb8a
-- Type: 21
-- Includes: ScriptLuaLib

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 20480 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = LoadMatchedDataInBuffer()
local l_0_2 = "wget http://[%d]+%.[%d]+%.[%d]+%.[%d]+/[/%w%.%-_]+;%schmod%s7+%s[/%w%.%-_]+;%s+[/%w%.%-_]+"
if GetPatternOccurenceCount(l_0_1, l_0_2) > 8 then
  return mp.INFECTED
end
return mp.CLEAN
