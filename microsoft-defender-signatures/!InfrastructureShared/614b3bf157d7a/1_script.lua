-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\614b3bf157d7a\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil or l_0_1.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_1.ppid, true) then
  return mp.CLEAN
end
local l_0_2 = nil
if (this_sigattrlog[16]).matched and (this_sigattrlog[16]).utf8p1 ~= nil then
  l_0_2 = (string.lower)((this_sigattrlog[16]).utf8p1)
else
  if (this_sigattrlog[17]).matched and (this_sigattrlog[17]).utf8p1 ~= nil then
    l_0_2 = (string.lower)((this_sigattrlog[17]).utf8p1)
  else
    if (this_sigattrlog[18]).matched and (this_sigattrlog[18]).utf8p1 ~= nil then
      l_0_2 = (string.lower)((this_sigattrlog[18]).utf8p1)
    else
      if (this_sigattrlog[19]).matched and (this_sigattrlog[19]).utf8p1 ~= nil then
        l_0_2 = (string.lower)((this_sigattrlog[19]).utf8p1)
      else
        if (this_sigattrlog[20]).matched and (this_sigattrlog[20]).utf8p1 ~= nil then
          l_0_2 = (string.lower)((this_sigattrlog[20]).utf8p1)
        else
          if (this_sigattrlog[21]).matched and (this_sigattrlog[21]).utf8p1 ~= nil then
            l_0_2 = (string.lower)((this_sigattrlog[21]).utf8p1)
          else
            if (this_sigattrlog[22]).matched and (this_sigattrlog[22]).utf8p1 ~= nil then
              l_0_2 = (string.lower)((this_sigattrlog[22]).utf8p1)
            else
              if (this_sigattrlog[23]).matched and (this_sigattrlog[23]).utf8p1 ~= nil then
                l_0_2 = (string.lower)((this_sigattrlog[23]).utf8p1)
              else
                if (this_sigattrlog[24]).matched and (this_sigattrlog[24]).utf8p1 ~= nil then
                  l_0_2 = (string.lower)((this_sigattrlog[24]).utf8p1)
                else
                  if (this_sigattrlog[25]).matched and (this_sigattrlog[25]).utf8p1 ~= nil then
                    l_0_2 = (string.lower)((this_sigattrlog[25]).utf8p1)
                  else
                    if (this_sigattrlog[26]).matched and (this_sigattrlog[26]).utf8p1 ~= nil then
                      l_0_2 = (string.lower)((this_sigattrlog[26]).utf8p1)
                    else
                      if (this_sigattrlog[27]).matched and (this_sigattrlog[27]).utf8p1 ~= nil then
                        l_0_2 = (string.lower)((this_sigattrlog[27]).utf8p1)
                      else
                        if (this_sigattrlog[28]).matched and (this_sigattrlog[28]).utf8p1 ~= nil then
                          l_0_2 = (string.lower)((this_sigattrlog[28]).utf8p1)
                        else
                          if (this_sigattrlog[29]).matched and (this_sigattrlog[29]).utf8p1 ~= nil then
                            l_0_2 = (string.lower)((this_sigattrlog[29]).utf8p1)
                          else
                            if (this_sigattrlog[30]).matched and (this_sigattrlog[30]).utf8p1 ~= nil then
                              l_0_2 = (string.lower)((this_sigattrlog[30]).utf8p1)
                            else
                              if (this_sigattrlog[31]).matched and (this_sigattrlog[31]).utf8p1 ~= nil then
                                l_0_2 = (string.lower)((this_sigattrlog[31]).utf8p1)
                              else
                                if (this_sigattrlog[32]).matched and (this_sigattrlog[32]).utf8p1 ~= nil then
                                  l_0_2 = (string.lower)((this_sigattrlog[32]).utf8p1)
                                else
                                  if (this_sigattrlog[33]).matched and (this_sigattrlog[33]).utf8p1 ~= nil then
                                    l_0_2 = (string.lower)((this_sigattrlog[33]).utf8p1)
                                  else
                                    if (this_sigattrlog[34]).matched and (this_sigattrlog[34]).utf8p1 ~= nil then
                                      l_0_2 = (string.lower)((this_sigattrlog[34]).utf8p1)
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
      end
    end
  end
end
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
;
(bm.trigger_sig)("BM_ExecWithMasqueradedExt", l_0_2)
TrackPidAndTechniqueBM("BM", "T1036.008", "DefenseEvasion_Masquerading_FileType")
taint(l_0_2, "masqueraded_file_extension_taint", 3600)
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

