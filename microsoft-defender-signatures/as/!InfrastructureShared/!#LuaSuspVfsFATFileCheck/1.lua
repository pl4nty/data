-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspVfsFATFileCheck
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_VirtualFS_FAT

local l_0_0 = false
local l_0_1 = false
local l_0_2 = ""
if mp.readu_u32(headerpage, 44) ~= 1397311045 then
  if mp.readu_u32(headerpage, 55) == 827605318 then
    local l_0_3 = mp.readu_u16(headerpage, 58)
    if l_0_3 == 12849 then
      l_0_1 = true
      l_0_2 = "FAT12"
    elseif l_0_3 == 13873 then
      l_0_1 = true
      l_0_2 = "FAT16"
    else
      mp.set_mpattribute("BM_VirtualFS_FAT_UNKNOWN")
      l_0_2 = tostring(l_0_3)
    end
  elseif mp.readu_u32(headerpage, 83) == 861159750 then
    local l_0_4 = mp.readu_u16(headerpage, 86)
    if l_0_4 == 12851 then
      l_0_1 = true
      l_0_2 = "FAT32"
    else
      mp.set_mpattribute("BM_VirtualFS_FAT_UNKNOWN")
      l_0_2 = tostring(l_0_4)
    end
  end
end
if l_0_1 and l_0_2 ~= "" then
  local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_5 ~= nil then
    l_0_5 = string.lower(l_0_5)
    local l_0_6 = {
      ["vmware.exe"] = true,
      ["vmplayer.exe"] = true
    }
    if l_0_6[l_0_5] then
      l_0_0 = true
      mp.set_mpattribute("Lua:FATCommonProcExcl")
    end
  end
  local l_0_7 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_7 ~= nil and 4 < #l_0_7 and string.sub(l_0_7, -4) == ".flp" then
    l_0_0 = true
    mp.set_mpattribute("Lua:FATCommonFileNameExcl")
  end
  if not l_0_0 then
    mp.set_mpattribute("BM_VirtualFS_" .. l_0_2)
    return mp.INFECTED
  end
end
return mp.CLEAN
