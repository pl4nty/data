-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a756_1061.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 4000000 or l_0_0 < 4000 then
  return mp.CLEAN
end
if pehdr.Machine ~= 332 then
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
if (hstrlog[4]).matched and (hstrlog[4]).VA > 38 then
  local l_0_2 = (pe.mmap_va)((hstrlog[4]).VA - 38, 38)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  for l_0_6 = 1, #l_0_2 - 1 do
    local l_0_7 = (string.byte)(l_0_2, l_0_6)
    local l_0_8 = (string.byte)(l_0_2, l_0_6 + 1)
    if l_0_7 == 106 and (l_0_8 >= 233 or l_0_8 <= 255) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

