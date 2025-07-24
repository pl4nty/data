-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaBasEncryptionA\1.luac 

-- params : ...
-- function num : 0
if (mp.GetScanSource)() ~= mp.SCANSOURCE_RTP then
  return mp.CLEAN
end
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = (string.match)(l_0_0, "(%.[^%.]+)$")
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if IsBasFileEncryptExt(l_0_1) == false then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = nil
local l_0_4 = false
if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_ID) == 4 then
  local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_IP)
  local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
  if l_0_5 == nil or l_0_5 == "" or l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  l_0_3 = (string.lower)(l_0_5 + "\\" + l_0_6)
  l_0_4 = true
else
  do
    local l_0_7 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
    if l_0_7 == nil or l_0_7 == "" then
      return mp.CLEAN
    end
    local l_0_8 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_8 == nil then
      return mp.CLEAN
    end
    local l_0_9 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
    if l_0_9 == nil or l_0_9 == "" then
      return mp.CLEAN
    end
    do
      local l_0_10 = (MpCommon.PathToWin32Path)(l_0_9)
      if l_0_10 == nil then
        return mp.CLEAN
      end
      l_0_3 = (string.lower)(l_0_7 + "\\" + (string.lower)(l_0_10 .. "\\" .. l_0_8))
      do
        local l_0_11, l_0_12, l_0_14, l_0_17, l_0_21, l_0_25, l_0_29, l_0_33, l_0_34, l_0_36, l_0_39, l_0_41, l_0_43, l_0_46, l_0_48, l_0_51, l_0_55 = tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_3 + "\\OriginalNonExecFiles")) or 0
        do
          local l_0_13, l_0_15, l_0_18, l_0_22, l_0_26 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_3 + "\\RelatedNonExecFiles")) or 0
          do
            local l_0_16, l_0_19, l_0_23 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_3 + "\\SmbNonExecFiles")) or 0
            do
              local l_0_20, l_0_24, l_0_28, l_0_32 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_3 + "\\RestNonExecFiles")) or 0
              if (((GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalNonExecFiles_Tel", l_0_2) and not GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_2)) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptSmbNonExecFiles_Tel", l_0_2)) and not GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_2)) or l_0_4 then
                UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptSmbNonExecFiles_Tel", l_0_2, "1")
                -- DECOMPILER ERROR at PC290: Overwrote pending register: R7 in 'AssignReg'

                local l_0_27, l_0_31, l_0_38, l_0_45, l_0_50, l_0_53, l_0_57 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_3 + "\\OriginalNonExecFiles", 1), UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_3 + "\\RelatedNonExecFiles", 1), UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_3 + "\\SmbNonExecFiles", 1), UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_3 + "\\RestNonExecFiles", 1)
              else
                do
                  if GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalProcs_Tel", l_0_3) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedProcs_Tel", l_0_3) then
                    UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_2, "1")
                    local l_0_30, l_0_35, l_0_37, l_0_40, l_0_42, l_0_44, l_0_47, l_0_49, l_0_52, l_0_56 = , 1
                  else
                    do
                      UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_2, "1")
                      do
                        local l_0_54, l_0_58 = nil
                        -- DECOMPILER ERROR at PC321: Confused about usage of register: R5 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC323: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC325: Confused about usage of register: R7 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC327: Confused about usage of register: R5 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC327: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC330: Confused about usage of register: R5 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC330: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC331: Confused about usage of register: R7 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC334: Confused about usage of register: R5 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC334: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC335: Confused about usage of register: R7 in 'UnsetPending'

                        if l_0_54 >= 2 or l_0_58 >= 3 or l_0_37 >= 4 or l_0_54 + l_0_58 >= 4 or l_0_54 + l_0_58 + l_0_37 >= 6 or l_0_54 + l_0_58 + l_0_37 + 1 >= 8 then
                          if l_0_4 then
                            (mp.ReportLowfi)(l_0_2, 1683897020)
                            return mp.INFECTED
                          else
                            ;
                            (mp.ReportLowfi)(l_0_2, 3472954176)
                            return mp.INFECTED
                          end
                        end
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

