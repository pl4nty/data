-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3a4b3b6ccdefe\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0, l_0_1 = nil, nil
local l_0_2 = ""
if (this_sigattrlog[3]).matched then
  l_0_0 = "ps_remoting"
  l_0_1 = "T1021.006"
  if (this_sigattrlog[3]).utf8p2 ~= nil then
    l_0_2 = (this_sigattrlog[3]).utf8p2
  end
else
  if (this_sigattrlog[9]).matched then
    l_0_0 = "winrs_outbound"
    l_0_1 = "T1021.006"
    if (this_sigattrlog[9]).utf8p2 ~= nil then
      l_0_2 = (this_sigattrlog[9]).utf8p2
    end
  else
    if (this_sigattrlog[10]).matched then
      l_0_0 = "wmi_remote"
      l_0_1 = "T1047"
      if (this_sigattrlog[10]).utf8p2 ~= nil then
        l_0_2 = (this_sigattrlog[10]).utf8p2
      end
    else
      if (this_sigattrlog[11]).matched then
        l_0_0 = "smb_pivot"
        l_0_1 = "T1021.002"
        if (this_sigattrlog[11]).utf8p2 ~= nil then
          l_0_2 = (this_sigattrlog[11]).utf8p2
        end
      else
        if (this_sigattrlog[13]).matched then
          l_0_0 = "psexec_pivot"
          l_0_1 = "T1021.002"
          if (this_sigattrlog[13]).utf8p2 ~= nil then
            l_0_2 = (this_sigattrlog[13]).utf8p2
          end
        else
          if (this_sigattrlog[15]).matched then
            l_0_0 = "rdp_pivot"
            l_0_1 = "T1021.001"
            if (this_sigattrlog[15]).utf8p2 ~= nil then
              l_0_2 = (this_sigattrlog[15]).utf8p2
            end
          end
        end
      end
    end
  end
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2)
if (string.find)(l_0_3, "localhost", 1, true) or (string.find)(l_0_3, "127.0.0.1", 1, true) or (string.find)(l_0_3, "::1", 1, true) then
  return mp.CLEAN
end
local l_0_4 = (bm.get_imagepath)()
do
  if l_0_4 ~= nil then
    local l_0_5 = (string.lower)(l_0_4)
    if (string.find)(l_0_5, "\\windows defender\\", 1, true) then
      return mp.CLEAN
    end
  end
  ;
  (bm.add_related_string)("WinRMHop_type", l_0_0, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("WinRMHop_cmd", l_0_3, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", l_0_1, "WinRMMultiHop")
  add_parents()
  return mp.INFECTED
end

