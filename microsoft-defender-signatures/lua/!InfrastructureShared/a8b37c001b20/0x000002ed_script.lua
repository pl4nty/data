-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a8b37c001b20\0x000002ed_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p2)
    if (string.find)(l_0_0, " -a ", 1, true) and (string.find)(l_0_0, "admin", 1, true) then
      TrackPidAndTechniqueBM("BM", "T1078", "PrivilegeEscalation_adminAcc_dseditgroup")
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1078", "PrivilegeEscalation_adminAcc_dscl")
  return mp.INFECTED
end

