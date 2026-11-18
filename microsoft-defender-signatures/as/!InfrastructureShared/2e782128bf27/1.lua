-- Threat: !InfrastructureShared
-- Name: 2e782128bf27
-- Type: 21

local l_0_0 = mp.getfilesize()
if 4000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
if mp.get_mpattribute("pea_ismsil") then
  return mp.CLEAN
end
if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
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
local l_0_2 = pe.get_versioninfo()
if l_0_2 ~= nil then
  local l_0_3 = l_0_2.OriginalFilename
  local l_0_4 = l_0_2.CompanyName
  if l_0_3 and l_0_4 and (string.find(string.lower(l_0_3), "fstx.dll", 1, true) or string.find(string.lower(l_0_3), "clfsw32.dll", 1, true)) and string.find(string.lower(l_0_4), "microsoft corporation", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
