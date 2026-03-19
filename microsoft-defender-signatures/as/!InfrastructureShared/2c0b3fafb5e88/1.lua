-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2c0b3fafb5e88\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
  l_0_0 = (this_sigattrlog[3]).utf8p1
else
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 ~= nil then
    l_0_0 = (this_sigattrlog[4]).utf8p1
  else
    if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
      l_0_0 = (this_sigattrlog[5]).utf8p1
    else
      if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 ~= nil then
        l_0_0 = (this_sigattrlog[6]).utf8p1
      else
        if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
          l_0_0 = (this_sigattrlog[7]).utf8p1
        else
          if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p1 ~= nil then
            l_0_0 = (this_sigattrlog[8]).utf8p1
          else
            if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
              l_0_0 = (this_sigattrlog[9]).utf8p1
            else
              if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
                l_0_0 = (this_sigattrlog[10]).utf8p1
              else
                if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p1 ~= nil then
                  l_0_0 = (this_sigattrlog[11]).utf8p1
                else
                  if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p1 ~= nil then
                    l_0_0 = (this_sigattrlog[12]).utf8p1
                  else
                    if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p1 ~= nil then
                      l_0_0 = (this_sigattrlog[13]).utf8p1
                    else
                      if (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p1 ~= nil then
                        l_0_0 = (this_sigattrlog[14]).utf8p1
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
  end
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "\\windows\\ntds\\ntds.dit", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_0, "\\windows defender\\", 1, true) then
  return mp.CLEAN
end
local l_0_1 = "T1003.003"
local l_0_2 = "ntds_file_copy"
if (string.find)(l_0_0, "ntds.dit", 1, true) then
  l_0_2 = "ntds_file_copy"
  l_0_1 = "T1003.003"
else
  if (string.find)(l_0_0, "globalroot", 1, true) then
    l_0_2 = "vss_ntds_copy"
    l_0_1 = "T1003.003"
  else
    if (string.find)(l_0_0, "%.sam", 1, true) or (string.find)(l_0_0, "\\sam", 1, true) then
      l_0_2 = "sam_hive_export"
      l_0_1 = "T1003.002"
    else
      if (string.find)(l_0_0, "%.system", 1, true) or (string.find)(l_0_0, "\\system", 1, true) then
        l_0_2 = "system_hive_export"
        l_0_1 = "T1003.002"
      else
        if (string.find)(l_0_0, "%.security", 1, true) or (string.find)(l_0_0, "\\security", 1, true) then
          l_0_2 = "security_hive_export"
          l_0_1 = "T1003.002"
        end
      end
    end
  end
end
;
(bm.add_related_file)(l_0_0)
;
(bm.add_related_string)("WinRMCred_reason", l_0_2, bm.RelatedStringBMReport)
;
(bm.add_related_string)("WinRMCred_path", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", l_0_1, "WinRMCredDump")
add_parents()
return mp.INFECTED

