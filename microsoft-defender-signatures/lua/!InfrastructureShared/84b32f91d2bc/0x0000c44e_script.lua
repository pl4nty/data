-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b32f91d2bc\0x0000c44e_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC15: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    local l_0_3 = ((this_sigattrlog[2]).utf8p2):lower()
    if contains(l_0_3, {"alexansisplugin", "zzzzinvokemanagedcustomactionoutofproc", "shcreatelocalserverrundll", "hp deskjet 3050a j611 series"}) then
      return mp.CLEAN
    end
    if not l_0_3 then
      return mp.CLEAN
    end
    local l_0_4 = nil
    local l_0_5 = contains
    local l_0_6 = l_0_3
    l_0_5 = l_0_5(l_0_6, {"\\programdata\\", "\\users\\public\\", "%userprofile%"})
    if not l_0_5 then
      l_0_5 = mp
      l_0_5 = l_0_5.CLEAN
      return l_0_5
    end
    l_0_6 = "(?:rundll32|regsvr32)(?:.exe)?\\s+\\w:\\\\(?:programdata|users\\\\public)\\\\[^\\\\]+\\.\\w{2,4}\\s*[,\\w$]+"
    l_0_6 = false
    for l_0_10,i_2 in ipairs(l_0_5) do
      l_0_6 = (MpCommon.StringRegExpSearch)(i_2, l_0_3)
      if l_0_6 then
        reportRelatedBmHits()
        if (bm.get_current_process_startup_info)() and ((bm.get_current_process_startup_info)()).ppid then
          (bm.request_SMS)(((bm.get_current_process_startup_info)()).ppid, "H")
          ;
          (bm.add_action)("SmsAsyncScanEvent", 1)
        end
        local l_0_12 = nil
        if extractDllForRegproc(l_0_3) and checkFileLastWriteTime(extractDllForRegproc(l_0_3), 3600) == false and (mp.IsKnownFriendlyFile)(extractDllForRegproc(l_0_3), true, false) == false then
          (bm.add_threat_file)(extractDllForRegproc(l_0_3))
        end
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

