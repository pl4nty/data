-- Threat: !InfrastructureShared
-- Name: !#Lua:FilledWithFFOnly
-- Type: 13
-- MpAttributes: NID:SuspiciousJenxcusFilename

local l_0_0 = mp.getfilesize()
if l_0_0 < 15000 then
  return mp.CLEAN
end
if 500000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2 = l_0_1:match("(\255+)")
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_0 ~= #l_0_2 then
  return mp.CLEAN
end
return mp.INFECTED
