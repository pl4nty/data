-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a7b31af6b91b\0x0000c091_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
if (this_sigattrlog[2]).matched then
  local l_0_1 = (this_sigattrlog[2]).utf8p1
  local l_0_2 = (this_sigattrlog[2]).utf8p2
  local l_0_3 = table.insert
  local l_0_4 = l_0_0
  local l_0_5 = {}
  l_0_5.Event = "ProcessCreate_0"
  l_0_5.ImagePath = l_0_1
  l_0_5.P2 = l_0_2
  l_0_3(l_0_4, l_0_5)
end
do
  if (this_sigattrlog[3]).matched then
    local l_0_6 = (this_sigattrlog[3]).utf8p1
    local l_0_7 = (this_sigattrlog[3]).utf8p2
    local l_0_8 = table.insert
    local l_0_9 = l_0_0
    local l_0_10 = {}
    l_0_10.Event = "OpenProc_0"
    l_0_10.ImagePath = l_0_6
    l_0_10.P2 = l_0_7
    l_0_8(l_0_9, l_0_10)
  end
  do
    if (this_sigattrlog[4]).matched then
      local l_0_11 = (this_sigattrlog[4]).utf8p1
      local l_0_12 = (this_sigattrlog[4]).utf8p2
      local l_0_13 = table.insert
      local l_0_14 = l_0_0
      local l_0_15 = {}
      l_0_15.Event = "ProcessCreate_1"
      l_0_15.ImagePath = l_0_11
      l_0_15.P2 = l_0_12
      l_0_13(l_0_14, l_0_15)
    end
    do
      ;
      (bm.add_related_string)("AdditionalInfo", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
end

