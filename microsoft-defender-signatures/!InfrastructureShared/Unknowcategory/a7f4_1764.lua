-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a7f4_1764.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 4000000 or l_0_0 < 4000 then
  return mp.CLEAN
end
if (mp.get_mpattribute)("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if (mp.get_mpattribute)("pea_ismsil") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("system32", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("syswow64", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (pe.get_versioninfo)()
if l_0_2 ~= nil then
  local l_0_3 = l_0_2.OriginalFilename
  local l_0_4 = l_0_2.CompanyName
  if l_0_3 and l_0_4 and ((string.find)((string.lower)(l_0_3), "packageinspector.exe", 1, true) or (string.find)((string.lower)(l_0_3), "resetengine.dll", 1, true)) and (string.find)((string.lower)(l_0_4), "microsoft corporation", 1, true) then
    return mp.CLEAN
  end
end
do
  if (hstrlog[1]).matched and (hstrlog[2]).matched and (hstrlog[1]).match_offsets_count == 2 and (hstrlog[2]).match_offsets_count == 2 then
    local l_0_5 = (pe.mmap_va)((hstrlog[1]).VA, ((hstrlog[1]).match_offsets)[2])
    if l_0_5 == nil then
      return mp.CLEAN
    end
    local l_0_6 = (pe.mmap_va)((hstrlog[2]).VA, ((hstrlog[2]).match_offsets)[2])
    if l_0_6 == nil then
      return mp.CLEAN
    end
    local l_0_7 = (pe.query_import)(pe.IMPORT_STATIC, 946125367)
    local l_0_8 = (pe.query_import)(pe.IMPORT_STATIC, 3434090342)
    local l_0_9 = (pe.query_import)(pe.IMPORT_STATIC, 2470684812)
    local l_0_10 = false
    local l_0_11 = false
    if l_0_7 ~= 0 or l_0_8 ~= 0 then
      local l_0_12 = (hstrlog[1]).VA + ((hstrlog[1]).match_offsets)[2]
      local l_0_13 = (mp.readu_u32)((pe.mmap_va)(l_0_12, 4), 1)
      local l_0_14 = l_0_12 + 4 + l_0_13
      if l_0_14 == l_0_7 or l_0_14 == l_0_8 then
        l_0_10 = true
      end
    end
    do
      do
        do
          if l_0_9 ~= 0 then
            local l_0_15 = (hstrlog[2]).VA + ((hstrlog[2]).match_offsets)[2]
            if l_0_15 + 4 + (mp.readu_u32)((pe.mmap_va)(l_0_15, 4), 1) == l_0_9 then
              l_0_11 = true
            end
          end
          if l_0_10 and l_0_11 then
            return mp.INFECTED
          end
          return mp.CLEAN
        end
      end
    end
  end
end

