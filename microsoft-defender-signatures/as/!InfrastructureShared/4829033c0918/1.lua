-- Threat: !InfrastructureShared
-- Name: 4829033c0918
-- Type: 21
-- Includes: ScriptLuaLib

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 10240 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = LoadMatchedDataInBuffer()
local l_0_2 = "wget http://[%d]+%.[%d]+%.[%d]+%.[%d]+/[%w%.%-]+;%s*chmod%s777%s[/%w%.%-]+;%s[/%w%.%-]+;%srm%s%-r?%s[/%w%.%-]+"
if GetPatternOccurenceCount(l_0_1, l_0_2) > 5 then
  return mp.INFECTED
end
return mp.CLEAN
