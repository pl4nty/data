-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a778_1090.luac 

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
if l_0_1:find("xboxgames", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (pe.get_versioninfo)()
if l_0_2 ~= nil then
  local l_0_3 = l_0_2.OriginalFilename
  local l_0_4 = l_0_2.CompanyName
  if l_0_3 and l_0_4 and ((string.find)((string.lower)(l_0_3), "fstx.dll", 1, true) or (string.find)((string.lower)(l_0_3), "clfsw32.dll", 1, true)) and (string.find)((string.lower)(l_0_4), "microsoft corporation", 1, true) then
    return mp.CLEAN
  end
end
do
  return mp.INFECTED
end

