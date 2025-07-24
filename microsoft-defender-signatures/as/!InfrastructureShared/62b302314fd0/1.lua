-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\62b302314fd0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ""
local l_0_1 = ""
if (this_sigattrlog[1]).matched then
  l_0_0 = (this_sigattrlog[1]).utf8p1
  l_0_1 = (this_sigattrlog[1]).utf8p2
  if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  l_0_0 = (mp.ContextualExpandEnvironmentVariables)(l_0_0)
  l_0_1 = (mp.ContextualExpandEnvironmentVariables)(l_0_1)
  if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
  l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
  if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  l_0_0 = (string.lower)(l_0_0)
  l_0_1 = (string.lower)(l_0_1)
  if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
else
  if (this_sigattrlog[2]).matched then
    l_0_0 = (this_sigattrlog[1]).utf8p2
    l_0_1 = (this_sigattrlog[1]).utf8p1
    if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
      return mp.CLEAN
    end
    l_0_0 = (mp.ContextualExpandEnvironmentVariables)(l_0_0)
    l_0_1 = (mp.ContextualExpandEnvironmentVariables)(l_0_1)
    if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
      return mp.CLEAN
    end
    l_0_0 = (MpCommon.PathToWin32Path)(l_0_0)
    l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
    if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
      return mp.CLEAN
    end
    l_0_0 = (string.lower)(l_0_0)
    l_0_1 = (string.lower)(l_0_1)
    if l_0_0 == nil or l_0_0 == "" or l_0_1 == nil or l_0_1 == "" then
      return mp.CLEAN
    end
  else
    return mp.CLEAN
  end
end
local l_0_2 = ""
local l_0_3 = ""
local l_0_4 = ""
l_0_2 = (string.match)(l_0_0, "(%.[^%.]+)$")
if l_0_2 ~= nil and l_0_2 ~= "" and IsBasFileEncryptExt(l_0_2) == true then
  l_0_4 = l_0_0
else
  l_0_3 = (string.match)(l_0_1, "(%.[^%.]+)$")
  if l_0_3 ~= nil and l_0_3 ~= "" and IsBasFileEncryptExt(l_0_3) == true then
    l_0_4 = l_0_1
  else
    return mp.CLEAN
  end
end
local l_0_5 = (bm.get_current_process_startup_info)()
if l_0_5 == nil or type(l_0_5) ~= "table" or l_0_5.ppid == nil or l_0_5.ppid == "" then
  return mp.CLEAN
end
local l_0_6 = (string.lower)(l_0_5.ppid)
if l_0_6 == nil then
  return mp.CLEAN
end
l_0_6 = (string.match)(l_0_6, "pid:(%w+),processstart.+")
if l_0_6 == nil then
  return mp.CLEAN
end
l_0_6 = tonumber(l_0_6)
if l_0_6 == nil or l_0_6 == 4 then
  return mp.CLEAN
end
local l_0_7 = (bm.get_imagepath)()
if l_0_7 == nil then
  return mp.CLEAN
end
l_0_7 = (MpCommon.PathToWin32Path)(l_0_7)
if l_0_7 == nil then
  return mp.CLEAN
end
l_0_7 = (string.lower)(l_0_7)
local l_0_8 = (string.lower)(l_0_5.ppid + "\\" + l_0_7)
do
  local l_0_9, l_0_10, l_0_12 = tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_8 + "\\OriginalNonExecFiles")) or 0
  do
    local l_0_11, l_0_13 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_8 + "\\RelatedNonExecFiles")) or 0
    local l_0_14 = nil
    do
      local l_0_15, l_0_16, l_0_17 = , 0, tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_8 + "\\RestNonExecFiles")) or 0
      if GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalNonExecFiles_Tel", l_0_4) then
        l_0_14 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_8 + "\\OriginalNonExecFiles", 1)
      else
      end
      if (((GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_4) and not GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptSmbNonExecFiles_Tel", l_0_4)) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_4)) and GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalProcs_Tel", l_0_8)) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedProcs_Tel", l_0_8) then
        UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_4, "1")
        -- DECOMPILER ERROR at PC401: Overwrote pending register: R10 in 'AssignReg'

      else
        UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_4, "1")
        -- DECOMPILER ERROR at PC409: Overwrote pending register: R12 in 'AssignReg'

      end
      -- DECOMPILER ERROR at PC416: Confused about usage of register: R10 in 'UnsetPending'

      -- DECOMPILER ERROR at PC419: Confused about usage of register: R10 in 'UnsetPending'

      -- DECOMPILER ERROR at PC420: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC423: Confused about usage of register: R10 in 'UnsetPending'

      -- DECOMPILER ERROR at PC424: Confused about usage of register: R11 in 'UnsetPending'

      if l_0_14 >= 2 or UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_8 + "\\RelatedNonExecFiles", 1) >= 3 or 1 >= 4 or l_0_14 + UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_8 + "\\RelatedNonExecFiles", 1) >= 4 or l_0_14 + UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_8 + "\\RelatedNonExecFiles", 1) + 1 >= 6 or l_0_14 + UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_8 + "\\RelatedNonExecFiles", 1) + 1 + UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_8 + "\\RestNonExecFiles", 1) >= 8 then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

