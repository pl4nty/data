-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4f5b3cab36d8b\0x000008a4_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[2]).matched then
  l_0_3 = (this_sigattrlog[2]).utf8p1
else
  if (this_sigattrlog[3]).matched then
    l_0_3 = (this_sigattrlog[3]).utf8p1
  else
    if (this_sigattrlog[4]).matched then
      l_0_3 = (this_sigattrlog[4]).utf8p1
    else
      if (this_sigattrlog[5]).matched then
        l_0_3 = (this_sigattrlog[5]).utf8p1
      else
        if (this_sigattrlog[6]).matched then
          l_0_3 = (this_sigattrlog[6]).utf8p1
        else
          if (this_sigattrlog[7]).matched then
            l_0_3 = (this_sigattrlog[7]).utf8p1
          else
            if (this_sigattrlog[8]).matched then
              l_0_3 = (this_sigattrlog[8]).utf8p1
            else
              if (this_sigattrlog[9]).matched then
                l_0_3 = (this_sigattrlog[9]).utf8p1
              else
                if (this_sigattrlog[10]).matched then
                  l_0_3 = (this_sigattrlog[10]).utf8p1
                else
                  if (this_sigattrlog[11]).matched then
                    l_0_3 = (this_sigattrlog[11]).utf8p1
                  else
                    if (this_sigattrlog[12]).matched then
                      l_0_3 = (this_sigattrlog[12]).utf8p1
                    else
                      if (this_sigattrlog[13]).matched then
                        l_0_3 = (this_sigattrlog[13]).utf8p1
                      else
                        if (this_sigattrlog[14]).matched then
                          l_0_3 = (this_sigattrlog[14]).utf8p1
                        else
                          if (this_sigattrlog[15]).matched then
                            l_0_3 = (this_sigattrlog[15]).utf8p1
                          else
                            if (this_sigattrlog[16]).matched then
                              l_0_3 = (this_sigattrlog[16]).utf8p1
                            else
                              if (this_sigattrlog[17]).matched then
                                l_0_3 = (this_sigattrlog[17]).utf8p1
                              else
                                if (this_sigattrlog[18]).matched then
                                  l_0_3 = (this_sigattrlog[18]).utf8p1
                                else
                                  if (this_sigattrlog[19]).matched then
                                    l_0_3 = (this_sigattrlog[19]).utf8p1
                                  else
                                    if (this_sigattrlog[20]).matched then
                                      l_0_3 = (this_sigattrlog[20]).utf8p1
                                    else
                                      if (this_sigattrlog[21]).matched then
                                        l_0_3 = (this_sigattrlog[21]).utf8p1
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
(bm.trigger_sig)("BM_MacFileCreateInDPRKPaths", l_0_3)
return mp.CLEAN

