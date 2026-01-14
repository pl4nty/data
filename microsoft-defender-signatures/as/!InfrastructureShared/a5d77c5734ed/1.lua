-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a5d77c5734ed\1.luac 

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
        l_0_7 = "((ftp|http[s]?)://[^\\\"\\s\\\']+)"
        l_0_8 = table_dedup
        l_0_8 = l_0_8(multi_match_regex(l_0_6, l_0_7))
        for l_0_12,l_0_13 in ipairs(l_0_8) do
          local l_0_9 = {}
          -- DECOMPILER ERROR at PC66: Confused about usage of register: R12 in 'UnsetPending'

          if UrlGrader(R12_PC66, "ALF:Trojan:Win32/PFApp_SuspDownload.A", false) < 0 then
            return mp.CLEAN
          end
          if UrlGrader(R12_PC66, "ALF:Trojan:Win32/PFApp_SuspDownload.A", false) ~= 0 then
            l_0_9[l_0_14] = R12_PC66
          end
        end
        -- DECOMPILER ERROR at PC81: Confused about usage of register: R7 in 'UnsetPending'

        local l_0_15, l_0_16 = , safeJsonSerialize(l_0_9, 150, nil, true)
        if not (string.find)(l_0_16, "Susfile_extension", 1, true) then
          return mp.CLEAN
        end
        local l_0_17 = nil
        -- DECOMPILER ERROR at PC105: Overwrote pending register: R10 in 'AssignReg'

        if IsDeviceHVA() then
          do
            (MpCommon.BmTriggerSig)(l_0_1.ppid, "APML_SuspDownload_Servers", l_0_6 .. "[URLs]" .. l_0_16 .. "[HVA]" .. "")
            do return mp.INFECTED end
            return mp.CLEAN
          end
        end
      end
    end
  end
end

