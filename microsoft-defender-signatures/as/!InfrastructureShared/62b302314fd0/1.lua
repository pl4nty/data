-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\62b302314fd0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or type(l_0_0) ~= "string" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if l_0_0 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_0 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" and (l_0_0 ~= "d7c7c745-195f-4223-9c7a-99fb420fd000" or (MpCommon.IsSampled)(100, false, true, true) ~= true) then
  return mp.CLEAN
end
local l_0_1 = ""
local l_0_2 = ""
if (this_sigattrlog[1]).matched then
  l_0_1 = (this_sigattrlog[1]).utf8p1
  l_0_2 = (this_sigattrlog[1]).utf8p2
  if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_1 = (mp.ContextualExpandEnvironmentVariables)(l_0_1)
  l_0_2 = (mp.ContextualExpandEnvironmentVariables)(l_0_2)
  if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
  l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
  if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(l_0_1)
  l_0_2 = (string.lower)(l_0_2)
  if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
else
  if (this_sigattrlog[2]).matched then
    l_0_1 = (this_sigattrlog[1]).utf8p2
    l_0_2 = (this_sigattrlog[1]).utf8p1
    if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
      return mp.CLEAN
    end
    l_0_1 = (mp.ContextualExpandEnvironmentVariables)(l_0_1)
    l_0_2 = (mp.ContextualExpandEnvironmentVariables)(l_0_2)
    if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
      return mp.CLEAN
    end
    l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
    l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
    if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
      return mp.CLEAN
    end
    l_0_1 = (string.lower)(l_0_1)
    l_0_2 = (string.lower)(l_0_2)
    if l_0_1 == nil or l_0_1 == "" or l_0_2 == nil or l_0_2 == "" then
      return mp.CLEAN
    end
  else
    return mp.CLEAN
  end
end
local l_0_3 = ""
local l_0_4 = ""
local l_0_5 = ""
l_0_3 = (string.match)(l_0_1, "(%.[^%.]+)$")
if l_0_3 ~= nil and l_0_3 ~= "" and IsBasFileEncryptExt(l_0_3) == true then
  l_0_5 = l_0_1
else
  l_0_4 = (string.match)(l_0_2, "(%.[^%.]+)$")
  if l_0_4 ~= nil and l_0_4 ~= "" and IsBasFileEncryptExt(l_0_4) == true then
    l_0_5 = l_0_2
  else
    return mp.CLEAN
  end
end
local l_0_6 = (bm.get_current_process_startup_info)()
if l_0_6 == nil or type(l_0_6) ~= "table" or l_0_6.ppid == nil or l_0_6.ppid == "" then
  return mp.CLEAN
end
local l_0_7 = (string.lower)(l_0_6.ppid)
if l_0_7 == nil then
  return mp.CLEAN
end
l_0_7 = (string.match)(l_0_7, "pid:(%w+),processstart.+")
if l_0_7 == nil then
  return mp.CLEAN
end
l_0_7 = tonumber(l_0_7)
if l_0_7 == nil or l_0_7 == 4 then
  return mp.CLEAN
end
local l_0_8 = (bm.get_imagepath)()
if l_0_8 == nil then
  return mp.CLEAN
end
l_0_8 = (MpCommon.PathToWin32Path)(l_0_8)
if l_0_8 == nil then
  return mp.CLEAN
end
l_0_8 = (string.lower)(l_0_8)
local l_0_9 = (string.lower)(l_0_6.ppid .. "\\" .. l_0_8)
do
  local l_0_10, l_0_11, l_0_13 = tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_9 .. "\\OriginalNonExecFiles")) or 0
  do
    local l_0_12, l_0_14 = , tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_9 .. "\\RelatedNonExecFiles")) or 0
    local l_0_15 = nil
    do
      local l_0_16, l_0_17, l_0_18 = , 0, tonumber(GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_9 .. "\\RestNonExecFiles")) or 0
      if GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalNonExecFiles_Tel", l_0_5) then
        l_0_15 = UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_9 .. "\\OriginalNonExecFiles", 1)
      else
      end
      if (((GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_5) and not GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptSmbNonExecFiles_Tel", l_0_5)) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_5)) and GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_OriginalProcs_Tel", l_0_9)) or GetRqValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedProcs_Tel", l_0_9) then
        UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_RelatedNonExecFiles_Tel", l_0_5, "1")
        -- DECOMPILER ERROR at PC458: Overwrote pending register: R11 in 'AssignReg'

      else
        UpdateRqStrValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptRestNonExecFiles_Tel", l_0_5, "1")
        -- DECOMPILER ERROR at PC474: Overwrote pending register: R13 in 'AssignReg'

      end
      -- DECOMPILER ERROR at PC481: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC484: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC485: Confused about usage of register: R12 in 'UnsetPending'

      -- DECOMPILER ERROR at PC488: Confused about usage of register: R11 in 'UnsetPending'

      -- DECOMPILER ERROR at PC489: Confused about usage of register: R12 in 'UnsetPending'

      if l_0_15 >= 2 or UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_9 .. "\\RelatedNonExecFiles", 1) >= 3 or 1 >= 4 or l_0_15 + UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_9 .. "\\RelatedNonExecFiles", 1) >= 4 or l_0_15 + UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_9 .. "\\RelatedNonExecFiles", 1) + 1 >= 6 or l_0_15 + UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_9 .. "\\RelatedNonExecFiles", 1) + 1 + UpdateRqIntValueByKeyNS("BAS_SB_Coverage", "BAS_SB_EncryptProcs_Tel", l_0_9 .. "\\RestNonExecFiles", 1) >= 8 then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

