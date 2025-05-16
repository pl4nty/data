-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3a0b3a41e7284\0x0000c4c8_luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
local l_0_2 = (bm.get_imagepath)()
local l_0_3 = ""
local l_0_4 = 0
if (bm.get_current_process_startup_info)() and ((bm.get_current_process_startup_info)()).ppid then
  l_0_4 = ((bm.get_current_process_startup_info)()).ppid
end
if l_0_2 == nil then
  return mp.CLEAN
end
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_1 = (this_sigattrlog[1]).utf8p2
  l_0_3 = "BM_fsutil_symlink"
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    l_0_1 = (this_sigattrlog[2]).utf8p2
    l_0_3 = "BM_iisreset_stop"
  else
    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
      l_0_1 = (this_sigattrlog[3]).utf8p2
      l_0_3 = "BM_VSS_Shadowcopy"
    else
      if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
        l_0_1 = (this_sigattrlog[4]).utf8p2
        l_0_3 = "BM_WMIC_Shadowcopy"
      else
        if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
          l_0_1 = (this_sigattrlog[5]).utf8p2
          l_0_3 = "BM_bcdedit_Shadowcopy"
        else
          if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 ~= nil then
            l_0_1 = (this_sigattrlog[6]).utf8p2
            l_0_3 = "BM_bcdedit_Shadowcopy"
          else
            if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 ~= nil then
              l_0_1 = (this_sigattrlog[7]).utf8p2
              l_0_3 = "BM_clearlog"
            else
              if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil then
                l_0_1 = (this_sigattrlog[8]).utf8p2
                l_0_3 = "masskill"
              else
                if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p2 ~= nil then
                  l_0_1 = (this_sigattrlog[9]).utf8p2
                  l_0_3 = "masskill"
                else
                  if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p2 ~= nil then
                    l_0_1 = (this_sigattrlog[10]).utf8p2
                    l_0_3 = "masskill"
                  else
                    if (this_sigattrlog[11]).matched and (this_sigattrlog[11]).utf8p2 ~= nil then
                      l_0_1 = (this_sigattrlog[11]).utf8p2
                      l_0_3 = "BM_GenRansom"
                    else
                      if (this_sigattrlog[12]).matched and (this_sigattrlog[12]).utf8p2 ~= nil then
                        l_0_1 = (this_sigattrlog[12]).utf8p2
                        l_0_3 = "RansomNote"
                      else
                        if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p2 ~= nil then
                          l_0_1 = (this_sigattrlog[13]).utf8p2
                          l_0_3 = "RansomNote"
                        else
                          if (this_sigattrlog[14]).matched and (this_sigattrlog[14]).utf8p2 ~= nil then
                            l_0_1 = (this_sigattrlog[14]).utf8p2
                            l_0_3 = "RansomNote"
                          else
                            if (this_sigattrlog[15]).matched and (this_sigattrlog[15]).utf8p2 ~= nil then
                              l_0_1 = (this_sigattrlog[15]).utf8p2
                              l_0_3 = "RansomNote"
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
    end
  end
end
if l_0_3 == "masskill" and AddToAtomicCounter(l_0_3, 1, 600) >= 10 then
  l_0_3 = "BM_masskill"
end
if l_0_3 == "RansomNote" and AddToAtomicCounter(l_0_3, 1, 600) >= 5 then
  l_0_3 = "BM_RansomNote"
end
if StringStartsWith(l_0_3, "BM_") then
  if (MpCommon.DoesProcessHaveAttribute)(l_0_4, l_0_3) or (MpCommon.DoesProcessHaveAttribute)(l_0_4, "inherit:" .. l_0_3) then
    return mp.CLEAN
  end
  ;
  (MpCommon.AddProcessAttribute)(l_0_4, l_0_3, l_0_1, false)
  local l_0_5 = nil
  if #(MpCommon.GetProcessAttributes)(l_0_4) > 3 then
    (bm.add_related_string)("RanProcAttrib", safeJsonSerialize((MpCommon.GetProcessAttributes)(l_0_4)), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

