-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!BaseFileEncryptA\Includes\1.luac 

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
if l_0_0 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_0 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" then
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
  local l_0_3 = {}
  local l_0_4 = {}
  l_0_4["chronicle.exe"] = true
  l_0_3[".enc"] = l_0_4
  l_0_4 = l_0_3[l_0_2]
  l_0_4 = l_0_4[(string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))]
  if l_0_4 then
    l_0_4 = mp
    l_0_4 = l_0_4.CLEAN
    return l_0_4
  end
  l_0_4 = mp
  l_0_4 = l_0_4.set_mpattribute
  l_0_4("MpDisableMOACSyncInsert")
  l_0_4 = mp
  l_0_4 = l_0_4.set_mpattribute
  l_0_4("MpDisableCaching")
end
do
  local l_0_5 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = (MpCommon.PathToWin32Path)(l_0_5)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = (string.lower)(l_0_5)
  local l_0_6 = nil
  local l_0_7 = false
  if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_ID) == 4 then
    local l_0_8 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_IP)
    local l_0_9 = (mp.get_contextdata)(mp.CONTEXT_DATA_REMOTE_SESSION_USERNAME)
    if l_0_8 == nil or l_0_8 == "" or l_0_9 == nil or l_0_9 == "" then
      return mp.CLEAN
    end
    l_0_6 = (string.lower)(l_0_8 .. "\\" .. l_0_9)
    l_0_7 = true
  else
    do
      local l_0_10 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
      if l_0_10 == nil or l_0_10 == "" then
        return mp.CLEAN
      end
      local l_0_11 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
      if l_0_11 == nil then
        return mp.CLEAN
      end
      local l_0_12 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
      if l_0_12 == nil or l_0_12 == "" then
        return mp.CLEAN
      end
      local l_0_13 = (MpCommon.PathToWin32Path)(l_0_12)
      if l_0_13 == nil then
        return mp.CLEAN
      end
      do
        local l_0_14 = (string.lower)(l_0_13 .. "\\" .. l_0_11)
        l_0_6 = (string.lower)(l_0_10 .. "\\" .. l_0_14)
        do
          local l_0_15, l_0_16, l_0_18, l_0_21, l_0_25, l_0_29, l_0_33, l_0_37, l_0_38, l_0_40, l_0_43, l_0_45, l_0_47, l_0_50, l_0_52 = tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_6 .. "\\OriginalNonExecFiles")) or 0
          do
            local l_0_17, l_0_19, l_0_22, l_0_26, l_0_30 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_6 .. "\\RelatedNonExecFiles")) or 0
            do
              local l_0_20, l_0_23, l_0_27 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_6 .. "\\SmbNonExecFiles")) or 0
              do
                local l_0_24, l_0_28, l_0_32, l_0_36 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_6 .. "\\RestNonExecFiles")) or 0
                if (((GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalNonExecFiles_Tel", l_0_5) and not GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_5)) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptSmbNonExecFiles_Tel", l_0_5)) and not GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_5)) or l_0_7 then
                  UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptSmbNonExecFiles_Tel", l_0_5, "1")
                  -- DECOMPILER ERROR at PC361: Overwrote pending register: R8 in 'AssignReg'

                  local l_0_31, l_0_35, l_0_42, l_0_49, l_0_54 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_6 .. "\\OriginalNonExecFiles", 1), UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_6 .. "\\RelatedNonExecFiles", 1), UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_6 .. "\\SmbNonExecFiles", 1), UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_6 .. "\\RestNonExecFiles", 1)
                else
                  do
                    if GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalProcs_Tel", l_0_6) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedProcs_Tel", l_0_6) then
                      UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_5, "1")
                      local l_0_34, l_0_39, l_0_41, l_0_44, l_0_46, l_0_48, l_0_51, l_0_53 = , UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_6 .. "\\RelatedNonExecFiles", 1)
                    else
                      do
                        UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_5, "1")
                        -- DECOMPILER ERROR at PC408: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC410: Confused about usage of register: R7 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC412: Confused about usage of register: R8 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC414: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC414: Confused about usage of register: R7 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC417: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC417: Confused about usage of register: R7 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC418: Confused about usage of register: R8 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC421: Confused about usage of register: R6 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC421: Confused about usage of register: R7 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC422: Confused about usage of register: R8 in 'UnsetPending'

                        if l_0_34 >= 2 or l_0_39 >= 3 or l_0_41 >= 4 or l_0_34 + l_0_39 >= 4 or l_0_34 + l_0_39 + l_0_41 >= 6 or l_0_34 + l_0_39 + l_0_41 + UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_6 .. "\\RestNonExecFiles", 1) >= 8 then
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

