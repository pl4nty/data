-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\170b3fe1e80c6\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
    l_0_1 = string
    l_0_1 = l_0_1.match
    l_0_1 = l_0_1(l_0_0, "--status-all")
    if not l_0_1 then
      l_0_1 = mp
      l_0_1 = l_0_1.CLEAN
      return l_0_1
    end
  end
  TrackPidAndTechniqueBM("BM", "T1518", "Discovery_SoftwareDiscovery_mt2023", 300)
  return mp.INFECTED
end

