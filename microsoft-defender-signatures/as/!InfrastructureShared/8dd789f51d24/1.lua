-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8dd789f51d24\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC6: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC7: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("httpd.exe").GetParentProcInfo)()
-- DECOMPILER ERROR at PC12: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC16: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC17: Overwrote pending register: R4 in 'AssignReg'

do
  if not (l_0_1.image_path):match("w3wp") then
    local l_0_2, l_0_3 = not l_0_1 or not "tomcat" or ""
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R5 in 'AssignReg'

  if Contains_any_caseinsenstive(l_0_2, "apache") then
    local l_0_4 = nil
    if (mp.GetScannedPPID)() == "" or (mp.GetScannedPPID)() == nil then
      return mp.CLEAN
    end
    local l_0_5 = nil
    if (mp.GetProcessCommandLine)((mp.GetScannedPPID)()) then
      local l_0_6 = nil
      local l_0_7 = Contains_any_caseinsenstive
      local l_0_8 = l_0_6
      l_0_7 = l_0_7(l_0_8, {"downloadstring", "downloadfile"})
      if l_0_7 then
        l_0_7 = MpCommon
        l_0_7 = l_0_7.BmTriggerSig
        l_0_8 = l_0_1.ppid
        l_0_7(l_0_8, "APML_SuspDownload_Servers", l_0_6)
        l_0_7 = mp
        l_0_7 = l_0_7.INFECTED
        return l_0_7
      end
    end
  end
  do
    return mp.CLEAN
  end
end

