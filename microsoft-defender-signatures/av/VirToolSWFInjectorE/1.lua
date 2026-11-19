-- Threat: VirTool:SWF/Injector.E
-- Type: 13

if mp.bitand(mp.readu_u32(headerpage, 1), 16777215) ~= 5461830 then
  return mp.CLEAN
end
local l_0_0 = {
  ["SCRIPT:FlashExp_90eb7133c9"] = 3,
  ["SCRIPT:FlashExp_241c61c3e8"] = 3,
  ["SCRIPT:FlashExp_21212121212121212121"] = 2,
  ["SCRIPT:FlashExp_90909090909090909090"] = 2,
  ["SCRIPT:FlashExp_loadbytes"] = 1,
  ["SCRIPT:FlashExp_enter_frame"] = 1,
  ["SCRIPT:FlashExp_gotoandplay"] = 1,
  ["SCRIPT:FlashExp_readunsignedbyte"] = 1,
  ["SCRIPT:FlashExp_writebyte"] = 1
}
local l_0_1 = 0
for l_0_2, l_0_3 in pairs(l_0_0) do
  if mp.get_mpattribute(l_0_2) then
    l_0_1 = l_0_1 + l_0_3
  end
end
if 10 <= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
