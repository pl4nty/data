-- Threat: !InfrastructureShared
-- Name: !#Lua:FlashInPdfStreamCount.A
-- Type: 13
-- MpAttributes: !RPF:TopLevelFile

if mp.bitand(mp.readu_u32(headerpage, 1), 16777215) ~= 5461830 and mp.bitand(mp.readu_u32(headerpage, 1), 16777215) ~= 5461827 and mp.bitand(mp.readu_u32(headerpage, 1), 16777215) ~= 5461850 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
if l_0_0 ~= nil then
  local l_0_1 = string.match(l_0_0, "->%(pdf(%d+):")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = tonumber(l_0_1)
  if 5 < l_0_1 then
    mp.set_mpattribute("//Lua:FlashInPdfMoreThan_5")
  elseif 3 < l_0_1 then
    mp.set_mpattribute("//Lua:FlashInPdfMoreThan_3")
  elseif 2 < l_0_1 then
    mp.set_mpattribute("//Lua:FlashInPdfMoreThan_2")
  end
end
return mp.CLEAN
