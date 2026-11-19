-- Threat: !InfrastructureShared
-- Name: !#SLF:TrojanDropper:VBS/ShortPipe.H!dha
-- Type: 13
-- MpAttributes: BM_UNKNOWN_FILE

local l_0_0 = string.lower(mp.getfilename(mp.FILEPATH_QUERY_FNAME))
if l_0_0 == nil then
  return mp.CLEAN
end
if ".nes" ~= string.sub(l_0_0, -4) then
  return mp.CLEAN
end
local l_0_1 = mp.readheader(0, 48)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.gsub(l_0_1, "%z", "")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.find(l_0_2, "on error resume next", 1, true)
if l_0_3 ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
