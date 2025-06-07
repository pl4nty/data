-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e4b32bca07a5\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0, l_0_1, l_0_3, l_0_4 = nil, nil
  l_0_3 = this_sigattrlog
  l_0_3 = l_0_3[2]
  l_0_1 = l_0_3.utf8p1
  local l_0_2, l_0_5 = nil
else
end
do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
    local l_0_6 = (this_sigattrlog[3]).utf8p2
    do
      local l_0_7, l_0_8, l_0_9 = (this_sigattrlog[3]).utf8p1, true, (l_0_6 ~= "THREAT" or l_0_6 == "THREAT") and 5 or 1
      -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

      -- DECOMPILER ERROR at PC46: Confused about usage of register: R3 in 'UnsetPending'

      AppendToRollingQueue("RecentThreatsOnMachine", l_0_7, l_0_9, 1800, 100)
      local l_0_10 = nil
      if (MpCommon.PathToWin32Path)((bm.get_imagepath)()) == nil then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC72: Confused about usage of register: R2 in 'UnsetPending'

      if (sysio.IsPathAVExcluded)((MpCommon.PathToWin32Path)((bm.get_imagepath)()), false) == true then
        (bm.add_related_string)("isBMConcrete", tostring(l_0_8), bm.RelatedStringBMReport)
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

