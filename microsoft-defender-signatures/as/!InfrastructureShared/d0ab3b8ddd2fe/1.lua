-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d0ab3b8ddd2fe\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1 = nil
if (bm.get_current_process_startup_info)() == nil or ((bm.get_current_process_startup_info)()).ppid == nil or ((bm.get_current_process_startup_info)()).ppid == "" or ((bm.get_current_process_startup_info)()).command_line == nil then
  return mp.CLEAN
end
local l_0_2 = nil
-- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

if (string.find)(((bm.get_current_process_startup_info)()).command_line, "/etc/xdg/chk", 1, true) ~= nil or (string.find)(((bm.get_current_process_startup_info)()).command_line, "/etc/xdg/systemd/001", 1, true) ~= nil or (string.find)(((bm.get_current_process_startup_info)()).command_line, "/opt/microsoft/mdatp/conf/scripts", 1, true) then
  return mp.CLEAN
end
if (this_sigattrlog[25]).matched and (this_sigattrlog[25]).utf8p2 ~= nil then
  l_0_1 = ((this_sigattrlog[25]).utf8p2):lower()
else
  if (this_sigattrlog[26]).matched and (this_sigattrlog[26]).utf8p2 ~= nil then
    l_0_1 = ((this_sigattrlog[26]).utf8p2):lower()
  else
    if (this_sigattrlog[27]).matched and (this_sigattrlog[27]).utf8p2 ~= nil then
      l_0_1 = ((this_sigattrlog[27]).utf8p2):lower()
    else
      if (this_sigattrlog[28]).matched and (this_sigattrlog[28]).utf8p2 ~= nil then
        l_0_1 = ((this_sigattrlog[28]).utf8p2):lower()
      else
        if (this_sigattrlog[29]).matched and (this_sigattrlog[29]).utf8p2 ~= nil then
          l_0_1 = ((this_sigattrlog[29]).utf8p2):lower()
        else
          if (this_sigattrlog[30]).matched and (this_sigattrlog[30]).utf8p2 ~= nil then
            l_0_1 = ((this_sigattrlog[30]).utf8p2):lower()
          else
            if (this_sigattrlog[31]).matched and (this_sigattrlog[31]).utf8p2 ~= nil then
              l_0_1 = ((this_sigattrlog[31]).utf8p2):lower()
            else
              if (this_sigattrlog[32]).matched and (this_sigattrlog[32]).utf8p2 ~= nil then
                l_0_1 = ((this_sigattrlog[32]).utf8p2):lower()
              else
                if (this_sigattrlog[33]).matched and (this_sigattrlog[33]).utf8p2 ~= nil then
                  l_0_1 = ((this_sigattrlog[33]).utf8p2):lower()
                else
                  if (this_sigattrlog[34]).matched and (this_sigattrlog[34]).utf8p2 ~= nil then
                    l_0_1 = ((this_sigattrlog[34]).utf8p2):lower()
                  else
                    if (this_sigattrlog[35]).matched and (this_sigattrlog[35]).utf8p2 ~= nil then
                      l_0_1 = ((this_sigattrlog[35]).utf8p2):lower()
                    else
                      if (this_sigattrlog[44]).matched and (this_sigattrlog[44]).utf8p2 ~= nil then
                        l_0_1 = ((this_sigattrlog[44]).utf8p2):lower()
                      else
                        if (this_sigattrlog[45]).matched and (this_sigattrlog[45]).utf8p2 ~= nil then
                          l_0_1 = ((this_sigattrlog[45]).utf8p2):lower()
                        else
                          if (this_sigattrlog[46]).matched and (this_sigattrlog[46]).utf8p2 ~= nil then
                            l_0_1 = ((this_sigattrlog[46]).utf8p2):lower()
                          else
                            if (this_sigattrlog[47]).matched and (this_sigattrlog[47]).utf8p2 ~= nil then
                              l_0_1 = ((this_sigattrlog[47]).utf8p2):lower()
                            else
                              if (this_sigattrlog[48]).matched and (this_sigattrlog[48]).utf8p2 ~= nil then
                                l_0_1 = ((this_sigattrlog[48]).utf8p2):lower()
                              else
                                if (this_sigattrlog[49]).matched and (this_sigattrlog[49]).utf8p2 ~= nil then
                                  l_0_1 = ((this_sigattrlog[49]).utf8p2):lower()
                                else
                                  if (this_sigattrlog[50]).matched and (this_sigattrlog[50]).utf8p2 ~= nil then
                                    l_0_1 = ((this_sigattrlog[50]).utf8p2):lower()
                                  else
                                    if (this_sigattrlog[51]).matched and (this_sigattrlog[51]).utf8p2 ~= nil then
                                      l_0_1 = ((this_sigattrlog[51]).utf8p2):lower()
                                    else
                                      if (this_sigattrlog[36]).matched and (this_sigattrlog[36]).utf8p2 ~= nil then
                                        l_0_1 = ((this_sigattrlog[36]).utf8p2):lower()
                                      else
                                        if (this_sigattrlog[37]).matched and (this_sigattrlog[37]).utf8p2 ~= nil then
                                          l_0_1 = ((this_sigattrlog[37]).utf8p2):lower()
                                        else
                                          if (this_sigattrlog[38]).matched and (this_sigattrlog[38]).utf8p2 ~= nil then
                                            l_0_1 = ((this_sigattrlog[38]).utf8p2):lower()
                                          else
                                            if (this_sigattrlog[39]).matched and (this_sigattrlog[39]).utf8p2 ~= nil then
                                              l_0_1 = ((this_sigattrlog[39]).utf8p2):lower()
                                            else
                                              if (this_sigattrlog[40]).matched and (this_sigattrlog[40]).utf8p2 ~= nil then
                                                l_0_1 = ((this_sigattrlog[40]).utf8p2):lower()
                                              else
                                                if (this_sigattrlog[41]).matched and (this_sigattrlog[41]).utf8p2 ~= nil then
                                                  l_0_1 = ((this_sigattrlog[41]).utf8p2):lower()
                                                else
                                                  if (this_sigattrlog[42]).matched and (this_sigattrlog[42]).utf8p2 ~= nil then
                                                    l_0_1 = ((this_sigattrlog[42]).utf8p2):lower()
                                                  else
                                                    if (this_sigattrlog[43]).matched and (this_sigattrlog[43]).utf8p2 ~= nil then
                                                      l_0_1 = ((this_sigattrlog[43]).utf8p2):lower()
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
            end
          end
        end
      end
    end
  end
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_3 = nil
local l_0_4 = 0
if (string.find)(l_0_1, "grep -e", 1, true) ~= nil or (string.find)(l_0_1, "grep --color=auto -e", 1, true) ~= nil then
  for l_0_8,l_0_9 in pairs({"mdatp", "firewall", "littlesnitch", "opensnitch", "avast", "avira", "mcafee", "webprotection", "isecespd", "macmnsvc", "masvc", "avscan", "rtvscand", "symcfgd", "scmdaemon", "symantec", "osquery", "sophos", "elastic-endpoint", "falcon", "nessusd", "cbagentd", "td-agent", "packetbeat", "filebeat", "auditbeat", "CynetEPS"}) do
    local l_0_5 = nil
    -- DECOMPILER ERROR at PC566: Confused about usage of register: R9 in 'UnsetPending'

    if (string.find)(l_0_1, true, 1, true) ~= nil then
      l_0_4 = l_0_4 + 1
    end
  end
  if l_0_4 > 2 then
    TrackPidAndTechniqueBM("BM", "T1518.001", "SecuritySoftwareDiscovery_mt2023")
    return mp.INFECTED
  end
end
return mp.CLEAN

