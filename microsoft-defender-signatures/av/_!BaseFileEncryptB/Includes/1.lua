-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!BaseFileEncryptB\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (versioning.GetOrgID)()
if l_0_1 == nil or type(l_0_1) ~= "string" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if l_0_1 ~= "64eacc49-6a31-42c6-9b39-c3d9148e65f4" and l_0_1 ~= "0d5a49d5-57c7-40c0-ab8b-3a066e83b05a" then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
l_0_3 = l_0_3 .. "\\" .. l_0_2
if (string.find)(l_0_3, "[a-z]:\\windows\\") ~= nil then
  return mp.CLEAN
end
if l_0_2 ~= "sbsimulator.exe" and (string.find)(l_0_2, "sbsimulation_sb_[^%.]+%.exe") == nil and (string.find)(l_0_3, "[a-z]:\\program files\\safebreach\\") == nil then
  local l_0_4 = (sysio.GetPEVersionInfo)(l_0_3)
  if l_0_4 == nil then
    return mp.CLEAN
  end
  if l_0_4.OriginalFilename ~= nil and l_0_4.OriginalFilename ~= "" then
    local l_0_5 = (string.lower)(l_0_4.OriginalFilename)
    if l_0_5 ~= "sbsimulator.exe" and (string.find)(l_0_5, "sbsimulation_sb_[^%.]+%.exe") == nil then
      return mp.CLEAN
    end
  end
end
do
  if l_0_2 == "sbupdater.exe" then
    return mp.CLEAN
  end
  local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  l_0_6 = (string.lower)(l_0_6)
  local l_0_7 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
  if l_0_7 == nil or l_0_7 == "" then
    return mp.CLEAN
  end
  l_0_7 = (MpCommon.PathToWin32Path)(l_0_7)
  if l_0_7 == nil or l_0_7 == "" then
    return mp.CLEAN
  end
  l_0_7 = (string.lower)(l_0_7)
  local l_0_8 = (string.match)(l_0_6, "(%.[^%.]+)$")
  if l_0_8 == nil or l_0_8 == "" then
    return mp.CLEAN
  end
  do
    if IsBasFileEncryptExt(l_0_8) == false and l_0_0 == mp.SCANREASON_ONOPEN then
      local l_0_9 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILE_AGE)
      if l_0_9 == nil then
        return mp.CLEAN
      end
      if type(l_0_9) ~= "number" then
        return mp.CLEAN
      end
      if l_0_9 < 1 or l_0_9 > 60 then
        return mp.CLEAN
      end
      if (string.find)(l_0_7, "[a-z]:\\windows\\temp\\sb%-sim%-temp") == nil and (string.find)(l_0_7, "[a-z]:\\users\\[^\\]+\\appdata\\local\\temp\\sb_%d+_bs_") == nil then
        (mp.set_mpattribute)("MpDisableMOACSyncInsert")
        ;
        (mp.set_mpattribute)("MpDisableCaching")
        return mp.CLEAN
      end
    end
    ;
    (MpCommon.BmTriggerSigPropagate)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), "BAS_BaseFileEncryptProc", l_0_7)
    return mp.INFECTED
  end
end

