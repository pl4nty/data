-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\44cb3f023685f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
do
  if not (this_sigattrlog[16]).utf8p2 then
    local l_0_1 = this_sigattrlog[16] == nil or not (this_sigattrlog[16]).matched or ""
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  do
    local l_0_2 = (string.lower)(l_0_1)
    if (string.find)(l_0_2, "*", 1, true) then
      l_0_0 = "trustedhosts_registry_wildcard"
    else
      l_0_0 = "trustedhosts_registry_modify"
    end
    ;
    (bm.add_related_string)("WinRMCfg_reason", l_0_0, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("WinRMCfg_regval", l_0_2, bm.RelatedStringBMReport)
    WinRMSessionTrackProcess("BM", nil, "Listener")
    ;
    (mp.set_mpattribute)("Lua:ContextDataProcess/WinRMSessionProcess.A")
    TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMConfig")
    add_parents()
    do return mp.INFECTED end
    local l_0_3 = (bm.get_current_process_startup_info)()
    if isnull(l_0_3) or not l_0_3.command_line then
      return mp.CLEAN
    end
    local l_0_4 = (string.lower)(l_0_3.command_line or "")
    local l_0_5 = (bm.get_imagepath)()
    if isnull(l_0_5) then
      return mp.CLEAN
    end
    local l_0_6 = (string.lower)(l_0_5)
    if (string.find)(l_0_6, "\\windows defender\\", 1, true) then
      return mp.CLEAN
    end
    if (string.find)(l_0_4, "trustedhosts", 1, true) then
      if (string.find)(l_0_4, "\"*\"", 1, true) or (string.find)(l_0_4, "\'*\'", 1, true) or (string.find)(l_0_4, "value *", 1, true) or (string.find)(l_0_4, "=\"*\"", 1, true) then
        l_0_0 = "trustedhosts_wildcard"
      else
        l_0_0 = "trustedhosts_modify"
      end
    else
      if (string.find)(l_0_4, "enable-psremoting", 1, true) and (string.find)(l_0_4, "-force", 1, true) then
        l_0_0 = "psremoting_force"
      else
        if (string.find)(l_0_4, "allowunencrypted", 1, true) and (string.find)(l_0_4, "true", 1, true) then
          l_0_0 = "unencrypted_allow"
        else
          if (string.find)(l_0_4, "basic", 1, true) and (string.find)(l_0_4, "true", 1, true) and (string.find)(l_0_4, "auth", 1, true) then
            l_0_0 = "basic_auth_enable"
          else
            if (string.find)(l_0_4, "quickconfig", 1, true) and (string.find)(l_0_4, "-force", 1, true) then
              l_0_0 = "quickconfig_force"
            else
              if (string.find)(l_0_4, "create", 1, true) and (string.find)(l_0_4, "listener", 1, true) then
                l_0_0 = "listener_create"
              end
            end
          end
        end
      end
    end
    if l_0_0 == "" then
      return mp.CLEAN
    end
    ;
    (bm.add_related_string)("WinRMCfg_reason", l_0_0, bm.RelatedStringBMReport)
    ;
    (bm.add_related_string)("WinRMCfg_cmd", l_0_4, bm.RelatedStringBMReport)
    WinRMSessionTrackProcess("BM", nil, "Listener")
    ;
    (mp.set_mpattribute)("Lua:ContextDataProcess/WinRMSessionProcess.A")
    TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMConfig")
    add_parents()
    return mp.INFECTED
  end
end

