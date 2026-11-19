-- Threat: !InfrastructureShared
-- Name: 4629f4ee8f38
-- Type: 21
-- Includes: ScriptLuaLib

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 20480 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {
  "_log",
  ".log",
  "-log",
  "_access",
  "-access",
  ".access"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
local l_0_5 = LoadMatchedDataInBuffer()
local l_0_6 = "wget http://[%d]+%.[%d]+%.[%d]+%.[%d]+/[/%w%.%-_]+%s%-o%s[%w%.%-_]+;%schmod%s7+%s[/%w%.%-_]+;%s+[/%w%.%-_]+"
if GetPatternOccurenceCount(l_0_5, l_0_6) > 8 then
  return mp.INFECTED
end
return mp.CLEAN
