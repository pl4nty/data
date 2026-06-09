-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\291b3ffd3c646\1.luac 

-- params : ...
-- function num : 0
if (((((this_sigattrlog[2] ~= nil and (this_sigattrlog[2]).matched) or (this_sigattrlog[3] ~= nil and (this_sigattrlog[3]).matched) or (this_sigattrlog[4] ~= nil and (this_sigattrlog[4]).matched) or (this_sigattrlog[5] ~= nil and (this_sigattrlog[5]).matched) or (this_sigattrlog[6] ~= nil and (this_sigattrlog[6]).matched) or IsWinRMSessionForPpid("BM", nil, nil) or not IsWinRMSessionFoundInParents("BM", nil, 4, nil))))) then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[7]).matched then
  l_0_0 = "sam_hive"
else
  if (this_sigattrlog[8]).matched then
    l_0_0 = "security_hive"
  else
    if (this_sigattrlog[9]).matched then
      l_0_0 = "ntds_dit"
    else
      if (this_sigattrlog[10]).matched then
        l_0_0 = "lsass_dump_create"
      else
        if (this_sigattrlog[11]).matched then
          l_0_0 = "lsass_dump"
        else
          return mp.CLEAN
        end
      end
    end
  end
end
;
(bm.add_related_string)("winrm_credaccess", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMCredentialAccess")
TrackPidAndTechniqueBM("BM", "T1003", "WinRMCredentialAccess")
add_parents()
return mp.INFECTED

