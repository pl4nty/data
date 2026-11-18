-- Threat: !InfrastructureShared
-- Name: 4a29302e3d76
-- Type: 21
-- Includes: ScriptLuaLib

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 10240 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = LoadMatchedDataInBuffer()
local l_0_2 = "ftpget %-v %-u [%w]+ %-p [%w]+ %-p 21 [%d]+%.[%d]+%.[%d]+%.[%d]+ [/%w%.%s%-_]+;%s*chmod%s7+%s[/%w%.%-_]+;%s+[/%w%s%.%-_]+;%srm%s%-rf?%s[/%w%.%-_]+"
if GetPatternOccurenceCount(l_0_1, l_0_2) > 5 then
  return mp.INFECTED
end
return mp.CLEAN
