-- Threat: !InfrastructureShared
-- Name: !#Lua:CABDirtraversalINF
-- Type: 13
-- MpAttributes: BM_CAB_FILE & RPF:TopLevelFile

if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 1178817357 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 29) ~= 1 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 60) ~= 791555584 then
  return mp.CLEAN
end
local l_0_0 = mp.readheader(60, 255)
if string.find(l_0_0, "%.%.%/.*%.inf", 0) then
  return mp.INFECTED
end
return mp.CLEAN
