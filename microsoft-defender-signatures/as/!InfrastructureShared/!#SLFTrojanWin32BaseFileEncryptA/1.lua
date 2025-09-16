-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32BaseFileEncryptA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 == "64eacc49-6a31-42c6-9b39-c3d9148e65f4" or l_0_0 == "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" then
  return mp.CLEAN
end
if l_0_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" or (MpCommon.IsSampled)(15000, false, true, true) ~= true then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (string.match)(l_0_1, "(%.[^%.]+)$")
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsBasFileEncryptExt(l_0_2) == false then
  return mp.CLEAN
else
  ;
  (mp.set_mpattribute)("MpDisableMOACSyncInsert")
  ;
  (mp.set_mpattribute)("MpDisableCaching")
end
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
local l_0_4 = nil
local l_0_5 = false
if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_ID) == 4 then
  local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_IP)
  local l_0_7 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
  if l_0_6 == nil or l_0_6 == "" or l_0_7 == nil or l_0_7 == "" then
    return mp.CLEAN
  end
  l_0_4 = (string.lower)(l_0_6 .. "\\" .. l_0_7)
  l_0_5 = true
else
  do
    local l_0_8 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
    if l_0_8 == nil or l_0_8 == "" then
      return mp.CLEAN
    end
    local l_0_9 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_9 == nil then
      return mp.CLEAN
    end
    local l_0_10 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
    if l_0_10 == nil or l_0_10 == "" then
      return mp.CLEAN
    end
    local l_0_11 = (MpCommon.PathToWin32Path)(l_0_10)
    if l_0_11 == nil then
      return mp.CLEAN
    end
    do
      local l_0_12 = (string.lower)(l_0_11 .. "\\" .. l_0_9)
      l_0_4 = (string.lower)(l_0_8 .. "\\" .. l_0_12)
      do
        local l_0_13, l_0_14, l_0_16, l_0_19, l_0_23, l_0_27, l_0_31, l_0_35, l_0_36, l_0_38, l_0_40, l_0_43 = tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\OriginalNonExecFiles")) or 0
        do
          local l_0_15, l_0_17, l_0_20, l_0_24, l_0_28 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RelatedNonExecFiles")) or 0
          do
            local l_0_18, l_0_21, l_0_25 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\SmbNonExecFiles")) or 0
            do
              local l_0_22, l_0_26, l_0_30, l_0_34 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RestNonExecFiles")) or 0
              if (((GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalNonExecFiles_Tel", l_0_3) and not GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_3)) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptSmbNonExecFiles_Tel", l_0_3)) and not GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_3)) or l_0_5 then
                UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptSmbNonExecFiles_Tel", l_0_3, "1")
                -- DECOMPILER ERROR at PC356: Overwrote pending register: R8 in 'AssignReg'

                local l_0_29, l_0_33, l_0_42, l_0_45 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\OriginalNonExecFiles", 1), UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RelatedNonExecFiles", 1), UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\SmbNonExecFiles", 1), UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RestNonExecFiles", 1)
              else
                do
                  if GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalProcs_Tel", l_0_4) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedProcs_Tel", l_0_4) then
                    UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_3, "1")
                    local l_0_32, l_0_37, l_0_39, l_0_41, l_0_44 = , UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RelatedNonExecFiles", 1)
                  else
                    do
                      UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_3, "1")
                      do
                        local l_0_46 = nil
                        -- DECOMPILER ERROR at PC403: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC405: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC405: Confused about usage of register: R7 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC408: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC408: Confused about usage of register: R7 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC409: Confused about usage of register: R8 in 'UnsetPending'

                        if l_0_46 >= 2 or l_0_46 + l_0_37 >= 3 or l_0_46 + l_0_37 + l_0_39 + UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_4 .. "\\RestNonExecFiles", 1) >= 4 then
                          (MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "BAS_BaseFileEncryptProcTel", l_0_3)
                          return mp.INFECTED
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

