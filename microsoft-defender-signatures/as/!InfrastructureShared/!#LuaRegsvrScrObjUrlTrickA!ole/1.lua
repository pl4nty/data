-- Threat: !InfrastructureShared
-- Name: !#Lua:RegsvrScrObjUrlTrick.A!ole
-- Type: 13
-- MpAttributes: SCPT:RegsvrScrObjUrlTrick.A

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "%->%(ole stream") then
  return mp.INFECTED
end
return mp.CLEAN
