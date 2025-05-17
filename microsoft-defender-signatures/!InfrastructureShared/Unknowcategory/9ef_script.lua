-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9ef_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  if (mp.bitand)((mp.get_contextdata)(mp.CONTEXT_DATA_DEVICE_CHARACTERISTICS), 264193) ~= 264193 then
    return mp.CLEAN
  end
  if not peattributes.isdll then
    return mp.CLEAN
  end
  if not peattributes.hasexports then
    return mp.CLEAN
  end
  if ((pehdr.DataDirectory)[1]).Size == 0 then
    return mp.CLEAN
  end
  if (mp.get_mpattribute)("Lua:SenseIRCretaeFileinTemp") then
    return mp.CLEAN
  end
  local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
  local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_2 = (MpCommon.PathToWin32Path)(l_0_2)
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_2 = (string.lower)(l_0_2)
  if (string.find)(l_0_2, "\\windows\\temp\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = {}
  l_0_3[".exe"] = true
  l_0_3[".dll"] = true
  l_0_3[".cpl"] = true
  l_0_3[".ocx"] = true
  l_0_3[".pyd"] = true
  if l_0_3[l_0_1:sub(-4)] then
    return mp.CLEAN
  end
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH)
  if not l_0_4:find("\160", 1, true) then
    return mp.CLEAN
  end
  if (string.find)((string.lower)(l_0_4), "\\windows\\temp\\", 1, true) then
    return mp.CLEAN
  end
  if l_0_1:find("^%l+%.%l%l%l$") or l_0_1:find("^~%$%l+%.%l%l%l$") or l_0_1:find("^%w+%.%w+%.%w+%.%w+%.%w+%.%w+%.%w+%.%w+$") or l_0_1:find("^%w%w%w%w%w+%.%w+$") then
    local l_0_5 = ((pehdr.DataDirectory)[1]).RVA
    ;
    (mp.readprotection)(false)
    local l_0_6 = (mp.readfile)((pe.foffset_rva)(l_0_5), 36)
    if (mp.readu_u32)(l_0_6, 21) ~= 1 then
      return mp.CLEAN
    end
    if (mp.readu_u32)(l_0_6, 25) ~= 1 then
      return mp.CLEAN
    end
    local l_0_7 = (mp.readu_u32)(l_0_6, 33)
    l_0_6 = (pe.mmap_rva)(l_0_7, 4)
    local l_0_8 = (mp.readu_u32)(l_0_6, 1)
    local l_0_9 = (pe.mmap_rva)(l_0_8, 32)
    if l_0_9:find("^%l+") and ((string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) == "msiexec.exe" or (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) == "rundll32.exe") then
      local l_0_10 = (MpCommon.PathToWin32Path)(l_0_4) .. "\\IndexerVolumeGuid"
      ;
      (mp.ReportLowfi)(l_0_10, 162679141)
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

