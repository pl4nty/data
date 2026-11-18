-- Threat: !InfrastructureShared
-- Name: 4429afe2bc03
-- Type: 21
-- Includes: ScriptLuaLib

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 10240 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = LoadMatchedDataInBuffer()
local l_0_2 = "wget http://[%d]+%.[%d]+%.[%d]+%.[%d]+/[%w%.%-]+;%s*chmod%s%+x%s[/%w%.%-]+;%s[/%w%.%s%-]+;%s+rm%s%-?r?f?%s*[/%w%.%-]+"
if GetPatternOccurenceCount(l_0_1, l_0_2) > 5 then
  return mp.INFECTED
end
return mp.CLEAN
