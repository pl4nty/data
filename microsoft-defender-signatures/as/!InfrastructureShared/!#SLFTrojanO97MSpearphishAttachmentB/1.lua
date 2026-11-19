-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:O97M/SpearphishAttachment.B
-- Type: 13
-- MpAttributes: !RPF:TopLevelFile

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 40 or l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "->", 1, true) == nil then
  return mp.CLEAN
end
local l_0_2
if string.find(l_0_0, "newtonsoft.json", 1, true) ~= nil or string.find(l_0_1, "newtonsoft.json", 1, true) ~= nil then
  return mp.CLEAN
end
if (string.find(l_0_0, "\\appdata\\local\\packages\\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\\localstate\\files", 1, true) ~= nil or string.find(l_0_0, "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook", 1, true) ~= nil) and (string.find(l_0_1, "/embeddings/oleobject", 1, true) ~= nil and string.find(l_0_1, ".bin->(ole stream", 1, true) ~= nil or string.find(l_0_1, "->ole stream", 1, true) ~= nil and string.find(l_0_1, ")->", 1, true) ~= nil or string.find(l_0_1, "->(rtf0", 1, true) ~= nil and string.find(l_0_1, ")->", 1, true) ~= nil) and (string.sub(l_0_1, #l_0_1 - 3, #l_0_1 - 3) == "." or string.sub(l_0_1, #l_0_1 - 2, #l_0_1 - 2) == ".") then
  l_0_2 = 1
end
local l_0_3 = {
  vbs = true,
  vbe = true,
  lnk = true,
  bat = true,
  cmd = true,
  js = true,
  hta = true,
  exe = true,
  wsh = true,
  ps1 = true,
  jse = true
}
if l_0_2 ~= nil then
  if string.sub(l_0_1, #l_0_1 - 3, #l_0_1 - 3) == "." then
    local l_0_4 = string.sub(l_0_1, -3)
    if l_0_4 ~= nil and l_0_3[l_0_4] == true then
      return mp.INFECTED
    end
    return mp.INFECTED
  elseif string.sub(l_0_1, #l_0_1 - 2, #l_0_1 - 2) == "." then
    local l_0_5 = string.sub(l_0_1, -2)
    if l_0_5 ~= nil and l_0_3[l_0_5] == true then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
