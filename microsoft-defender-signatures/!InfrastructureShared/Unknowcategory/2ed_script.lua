-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\2ed_luac 

-- params : ...
-- function num : 0
local l_0_0 = (macho.GetSegment)("LC_CODE_SIGNATURE", 8, 4)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = 0
local l_0_3 = 256
for l_0_7 = (string.len)(l_0_0), 1, -1 do
  l_0_2 = (string.byte)(l_0_0, l_0_7)
  l_0_1 = l_0_1 * l_0_3 + l_0_2
end
;
(mp.set_mpattributeex)("MpCodeSignatureOffset", l_0_1)
return mp.CLEAN

