-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\693b34827aee2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = nil
if (this_sigattrlog[16]).matched and (this_sigattrlog[16]).utf8p2 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[16]).utf8p2)
else
  if (this_sigattrlog[17]).matched and (this_sigattrlog[17]).utf8p2 ~= nil then
    l_0_1 = (string.lower)((this_sigattrlog[17]).utf8p2)
  else
    if (this_sigattrlog[18]).matched and (this_sigattrlog[18]).utf8p2 ~= nil then
      l_0_1 = (string.lower)((this_sigattrlog[18]).utf8p2)
    else
      if (this_sigattrlog[19]).matched and (this_sigattrlog[19]).utf8p2 ~= nil then
        l_0_1 = (string.lower)((this_sigattrlog[19]).utf8p2)
      else
        if (this_sigattrlog[20]).matched and (this_sigattrlog[20]).utf8p2 ~= nil then
          l_0_1 = (string.lower)((this_sigattrlog[20]).utf8p2)
        else
          if (this_sigattrlog[21]).matched and (this_sigattrlog[21]).utf8p2 ~= nil then
            l_0_1 = (string.lower)((this_sigattrlog[21]).utf8p2)
          else
            if (this_sigattrlog[22]).matched and (this_sigattrlog[22]).utf8p2 ~= nil then
              l_0_1 = (string.lower)((this_sigattrlog[22]).utf8p2)
            else
              if (this_sigattrlog[23]).matched and (this_sigattrlog[23]).utf8p2 ~= nil then
                l_0_1 = (string.lower)((this_sigattrlog[23]).utf8p2)
              else
                if (this_sigattrlog[24]).matched and (this_sigattrlog[24]).utf8p2 ~= nil then
                  l_0_1 = (string.lower)((this_sigattrlog[24]).utf8p2)
                else
                  if (this_sigattrlog[25]).matched and (this_sigattrlog[25]).utf8p2 ~= nil then
                    l_0_1 = (string.lower)((this_sigattrlog[25]).utf8p2)
                  else
                    if (this_sigattrlog[26]).matched and (this_sigattrlog[26]).utf8p2 ~= nil then
                      l_0_1 = (string.lower)((this_sigattrlog[26]).utf8p2)
                    else
                      if (this_sigattrlog[27]).matched and (this_sigattrlog[27]).utf8p2 ~= nil then
                        l_0_1 = (string.lower)((this_sigattrlog[27]).utf8p2)
                      else
                        if (this_sigattrlog[28]).matched and (this_sigattrlog[28]).utf8p2 ~= nil then
                          l_0_1 = (string.lower)((this_sigattrlog[28]).utf8p2)
                        else
                          if (this_sigattrlog[29]).matched and (this_sigattrlog[29]).utf8p2 ~= nil then
                            l_0_1 = (string.lower)((this_sigattrlog[29]).utf8p2)
                          else
                            if (this_sigattrlog[30]).matched and (this_sigattrlog[30]).utf8p2 ~= nil then
                              l_0_1 = (string.lower)((this_sigattrlog[30]).utf8p2)
                            else
                              if (this_sigattrlog[31]).matched and (this_sigattrlog[31]).utf8p2 ~= nil then
                                l_0_1 = (string.lower)((this_sigattrlog[31]).utf8p2)
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
if l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_2 = 3848698581
;
(mp.ReportLowfi)(l_0_1, l_0_2)
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1003.008", "CredentialAccess")
addRelatedProcess()
return mp.INFECTED

