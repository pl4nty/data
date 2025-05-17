-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2c5b31d5fc455\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
    l_0_1 = string
    l_0_1 = l_0_1.find
    l_0_1 = l_0_1(l_0_0, " stop", 1, true)
    if not l_0_1 then
      l_0_1 = mp
      l_0_1 = l_0_1.CLEAN
      return l_0_1
    end
  end
  TrackPidAndTechniqueBM("BM", "T1489", "Impact_ServiceStop")
  return mp.INFECTED
end

