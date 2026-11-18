-- Threat: \x89ANemucod.TSR
-- Type: 13
-- MpAttributes: Lua:WSHExt & InO365 & !SCPT:Nemucod_exclusion

if string.len(mp.getfilename()) < 10 then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "%d+%.zip%->%d+%.js") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
