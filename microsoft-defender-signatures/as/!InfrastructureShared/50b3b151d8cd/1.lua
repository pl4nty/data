-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\50b3b151d8cd\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil and (this_sigattrlog[1]).utf8p2 ~= "" then
    local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p2)
    if (string.find)(l_0_0, " -adminuser ", 1, true) then
      TrackPidAndTechniqueBM("BM", "T1078", "PrivilegeEscalation_adminAcc_sysadminctl_secToken")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

