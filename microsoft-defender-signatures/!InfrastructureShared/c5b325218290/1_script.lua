-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c5b325218290\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0 = nil
  local l_0_1 = (string.match)(l_0_0, "SrcIp=([^;]+);")
  if not l_0_1 then
    return mp.CLEAN
  end
  if not IsHostAttackServer(l_0_1) then
    TrackAttackerServer(l_0_1)
  end
  TrackPidAndTechniqueBM("BM", "T1020", "active_attacker_server_connection_b")
  return mp.INFECTED
end
do
  return mp.CLEAN
end

