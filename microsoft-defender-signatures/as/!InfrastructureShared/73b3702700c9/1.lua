-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\73b3702700c9\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  local l_0_2 = nil
  if contains(l_0_2, {"\\program files", "\\appdata\\local\\apps\\2.0\\", "icue.exe"}) then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if IsProcNameInParentProcessTree("BM", {"winword.exe", "excel.exe", "powerpnt.exe", "mspub.exe", "wscript.exe", "cscript.exe", "mshta.exe", "powershell.exe", "pwsh.exe", "rundll32.exe", "regsvr32.exe", "wmic.exe", "wmiprvse.exe"}) then
    add_parents()
    local l_0_4 = nil
    if (bm.get_imagepath)() == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC78: Confused about usage of register: R3 in 'UnsetPending'

    do
      do
        if (string.find)((string.lower)((bm.get_imagepath)()), "\\appdata\\", 1, true) and (string.find)((string.lower)((bm.get_imagepath)()), "_x\\", 1, true) then
          local l_0_5 = nil
          if (bm.get_current_process_startup_info)() == nil or ((bm.get_current_process_startup_info)()).ppid == nil then
            return mp.CLEAN
          end
          ;
          (bm.request_SMS)(((bm.get_current_process_startup_info)()).ppid, "M")
          ;
          (bm.add_action)("SmsAsyncScanEvent", 1000)
        end
        do return mp.INFECTED end
        return mp.CLEAN
      end
    end
  end
end

