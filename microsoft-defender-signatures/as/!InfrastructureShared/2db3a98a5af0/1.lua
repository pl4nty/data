-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2db3a98a5af0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "TamperConfigHosts"
local l_0_1, l_0_2 = (string.match)((this_sigattrlog[2]).utf8p2 or "", "TotalSizeWrite:(%d+);TotalSizeAppend:(%d+);")
local l_0_3 = bm.add_related_string
local l_0_4 = l_0_0
local l_0_5 = safeJsonSerialize
local l_0_6 = {}
do
  l_0_6.WriteSize = l_0_1 or ""
  l_0_6.AppendSize = l_0_2 or ""
  l_0_6.P2 = (this_sigattrlog[2]).utf8p2 or ""
  l_0_5 = l_0_5(l_0_6)
  l_0_6 = bm
  l_0_6 = l_0_6.RelatedStringBMReport
  l_0_3(l_0_4, l_0_5, l_0_6)
  l_0_3 = mp
  l_0_3 = l_0_3.INFECTED
  do return l_0_3 end
  -- DECOMPILER ERROR at PC38: freeLocal<0 in 'ReleaseLocals'

end

