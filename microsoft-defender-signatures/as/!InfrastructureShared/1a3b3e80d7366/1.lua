-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1a3b3e80d7366\1.luac 

-- params : ...
-- function num : 0
if not IsWinRMSessionForPpid("BM", nil, nil) and not IsWinRMSessionFoundInParents("BM", nil, 4, nil) then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[1]).matched then
  l_0_0 = "cmd.exe"
else
  if (this_sigattrlog[2]).matched then
    l_0_0 = "wscript.exe"
  else
    if (this_sigattrlog[3]).matched then
      l_0_0 = "cscript.exe"
    else
      if (this_sigattrlog[4]).matched then
        l_0_0 = "mshta.exe"
      else
        if (this_sigattrlog[5]).matched then
          l_0_0 = "regsvr32.exe"
        else
          if (this_sigattrlog[6]).matched then
            l_0_0 = "rundll32.exe"
          else
            if (this_sigattrlog[7]).matched then
              l_0_0 = "certutil.exe"
            else
              if (this_sigattrlog[8]).matched then
                l_0_0 = "bitsadmin.exe"
              else
                if (this_sigattrlog[9]).matched then
                  l_0_0 = "powershell.exe"
                else
                  if (this_sigattrlog[10]).matched then
                    l_0_0 = "pwsh.exe"
                  else
                    return mp.CLEAN
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
;
(bm.add_related_string)("winrm_lolbin", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMLolbinExec")
TrackPidAndTechniqueBM("BM", "T1059", "WinRMLolbinExec")
add_parents()
return mp.INFECTED

