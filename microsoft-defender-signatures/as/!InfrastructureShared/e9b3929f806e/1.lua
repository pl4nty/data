-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e9b3929f806e\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0, l_0_2 = nil
  if l_0_0 ~= "" and l_0_0 ~= nil then
    l_0_2 = l_0_2(l_0_0, "^tar%s+(%S+)")
    local l_0_1 = nil
    if l_0_2 then
      do
        l_0_1 = string
        l_0_1 = l_0_1.find
        l_0_1 = l_0_1(l_0_2, "c", 1, true)
        if l_0_1 then
          l_0_1 = TrackPidAndTechniqueBM
          l_0_1("BM", "T1560.001", "Collection_ArchiveCollectedData_ArchiveViaUtility")
          l_0_1 = mp
          l_0_1 = l_0_1.INFECTED
          return l_0_1
        else
          l_0_1 = mp
          l_0_1 = l_0_1.CLEAN
          return l_0_1
        end
        TrackPidAndTechniqueBM("BM", "T1560.001", "Collection_ArchiveCollectedData_ArchiveViaUtility")
        return mp.INFECTED
      end
    end
  end
end

