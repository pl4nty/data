-- Threat: !#MpIsExhaustiveScriptScan
-- Type: 12

if mp.bitand(mp.readu_u32(headerpage, 1), 16777215) ~= 5461830 then
  return mp.CLEAN
end
if mp.isparanoid() then
  return mp.INFECTED
end
return mp.CLEAN
