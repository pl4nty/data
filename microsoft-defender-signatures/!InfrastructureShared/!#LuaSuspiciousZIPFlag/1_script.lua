-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaSuspiciousZIPFlag\1_luac 

-- params : ...
-- function num : 0
if (mp.readu_u32)(headerpage, 1) ~= 67324752 then
  return mp.CLEAN
end
if (mp.readu_u16)(headerpage, 7) == 2048 then
  (mp.set_mpattribute)("Lua:ZipHasLanguageEncodingFlag")
end
local l_0_0 = (mp.readu_u16)(headerpage, 9)
local l_0_1 = (mp.readu_u32)(headerpage, 19)
local l_0_2 = (mp.readu_u32)(headerpage, 23)
if l_0_1 == 0 then
  local l_0_3 = (string.char)(80, 75, 1, 2)
  local l_0_4 = (string.find)(tostring(footerpage), l_0_3)
  l_0_1 = (mp.readu_u32)(footerpage, l_0_4 + 20)
  l_0_2 = (mp.readu_u32)(footerpage, l_0_4 + 24)
end
do
  do
    -- DECOMPILER ERROR at PC78: Confused about usage of register: R3 in 'UnsetPending'

    if l_0_2 / l_0_1 <= 5 or ((not 8 and l_0_0 == not l_0_1 or l_0_2 == 0 or 9) or l_0_2 / l_0_1 <= 5 or l_0_0 == 12) then
      (mp.set_mpattribute)("Lua:SuspiciousZipRatioCompression")
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC89: freeLocal<0 in 'ReleaseLocals'

  end
end

