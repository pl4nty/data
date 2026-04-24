-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\476b3876ff976\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0, l_0_1 = nil, nil
local l_0_2 = ""
if (this_sigattrlog[8]).matched then
  l_0_0 = "ps_remoting"
  l_0_1 = "T1021.006"
  if (this_sigattrlog[8]).utf8p2 ~= nil then
    l_0_2 = (this_sigattrlog[8]).utf8p2
  end
else
  if (this_sigattrlog[14]).matched then
    l_0_0 = "winrs_outbound"
    l_0_1 = "T1021.006"
    if (this_sigattrlog[14]).utf8p2 ~= nil then
      l_0_2 = (this_sigattrlog[14]).utf8p2
    end
  else
    if (this_sigattrlog[15]).matched then
      l_0_0 = "wmi_remote"
      l_0_1 = "T1047"
      if (this_sigattrlog[15]).utf8p2 ~= nil then
        l_0_2 = (this_sigattrlog[15]).utf8p2
      end
    else
      if (this_sigattrlog[16]).matched then
        l_0_1 = "T1021.002"
        if (this_sigattrlog[16]).utf8p2 ~= nil then
          l_0_2 = (this_sigattrlog[16]).utf8p2
          local l_0_3 = (string.lower)(l_0_2)
          if (string.find)(l_0_3, "\\c$", 1, true) or (string.find)(l_0_3, "\\admin$", 1, true) or (string.find)(l_0_3, "\\ipc$", 1, true) then
            l_0_0 = "smb_admin_pivot"
          end
        end
      else
        do
          if (this_sigattrlog[18]).matched then
            l_0_0 = "psexec_pivot"
            l_0_1 = "T1021.002"
            if (this_sigattrlog[18]).utf8p2 ~= nil then
              l_0_2 = (this_sigattrlog[18]).utf8p2
            end
          else
            if (this_sigattrlog[20]).matched then
              l_0_0 = "rdp_pivot"
              l_0_1 = "T1021.001"
              if (this_sigattrlog[20]).utf8p2 ~= nil then
                l_0_2 = (this_sigattrlog[20]).utf8p2
              end
            end
          end
          if l_0_0 == nil then
            return mp.CLEAN
          end
          local l_0_4 = (string.lower)(l_0_2)
          if (string.find)(l_0_4, "localhost", 1, true) or (string.find)(l_0_4, "127.0.0.1", 1, true) or (string.find)(l_0_4, "::1", 1, true) then
            return mp.CLEAN
          end
          local l_0_5 = (bm.get_current_process_startup_info)()
          do
            if not isnull(l_0_5) and l_0_5.command_line ~= nil then
              local l_0_6 = (string.lower)(l_0_5.command_line)
              if (string.find)(l_0_6, "-burn.clean.room=", 1, true) or (string.find)(l_0_6, "-burn.filehandle.", 1, true) then
                return mp.CLEAN
              end
              if (string.find)(l_0_6, "\\automation\\", 1, true) or (string.find)(l_0_6, "\\deployment\\", 1, true) then
                return mp.CLEAN
              end
            end
            local l_0_7 = (bm.get_imagepath)()
            do
              if l_0_7 ~= nil then
                local l_0_8 = (string.lower)(l_0_7)
                if (string.find)(l_0_8, "\\windows defender\\", 1, true) then
                  return mp.CLEAN
                end
              end
              ;
              (bm.add_related_string)("WinRMHop_type", l_0_0, bm.RelatedStringBMReport)
              ;
              (bm.add_related_string)("WinRMHop_cmd", l_0_4, bm.RelatedStringBMReport)
              TrackPidAndTechniqueBM("BM", l_0_1, "WinRMMultiHop")
              add_parents()
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end

